library hop.runner;

import 'dart:async';
import 'dart:collection';
import 'package:args/args.dart';
import 'package:bot/bot.dart';
import 'package:bot_io/bot_io.dart';
import 'package:bot_io/completion.dart';
import 'package:collection_helpers/equality.dart';
import 'package:logging/logging.dart';
import 'package:unmodifiable_collection/unmodifiable_collection.dart';

import 'package:hop/hop_core.dart';
import 'shared.dart';

part 'hop_runner/help.dart';
part 'hop_runner/hop_config.dart';
part 'hop_runner/hop_event.dart';
part 'hop_runner/runner.dart';
part 'hop_runner/task_registry.dart';
part 'hop_runner/_task_runtime.dart';

ArgParser _getParser(TaskRegistry config, Level defaultLogLevel) {
  assert(config.isFrozen);

  final parser = new ArgParser();

  config.tasks.forEach((taskName, task) {
    _initParserForTask(parser, taskName, task);
  });

  parser.addFlag(_COLOR_FLAG, defaultsTo: Console.supportsColor,
      help: 'Specifies if shell output can have color.');

  parser.addFlag(_PREFIX_FLAG, defaultsTo: true,
      help: 'Specifies if shell output is prefixed by the task name.');

  final logLevelAllowed = _sortedLogLevels
      .map((Level l) => l.name.toLowerCase())
      .toList();

  assert(logLevelAllowed.contains(defaultLogLevel.name.toLowerCase()));

  parser.addOption(_LOG_LEVEL_OPTION, allowed: logLevelAllowed,
      defaultsTo: defaultLogLevel.name.toLowerCase(),
      help: 'The log level at which task output is printed to the shell');

  return parser;
}

void _initParserForTask(ArgParser parser, String taskName, Task task) {
  final subParser = parser.addCommand(taskName);
  task.configureArgParser(subParser);
}

// DARTBUG: https://code.google.com/p/dart/issues/detail?id=15321
// Wating for this to land: https://code.google.com/p/dart/source/detail?r=30676
// it'd be nice if this was in logging
final List<Level> _sortedLogLevels = [Level.ALL, Level.CONFIG, Level.FINE,
                                      Level.FINER, Level.FINEST, Level.INFO,
                                      Level.OFF, Level.SEVERE, Level.SHOUT]
                                      ..sort();

const String _COLOR_FLAG = 'color';
const String _PREFIX_FLAG = 'prefix';
const String _LOG_LEVEL_OPTION = 'log-level';
