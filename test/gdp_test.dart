library gdp_test;

import 'package:unittest/unittest.dart';
import 'package:unittest/html_config.dart';
//import 'package:../app/main.dart';


part 'animations/sprite_sheet_test.dart';
part 'audio/sound_manager_test.dart';

part 'camera/camera_test.dart';
part 'camera/adjusted_context_test.dart';

part 'levels/level_manager_test.dart';

part 'objects/game_object_test.dart';
part 'objects/alien_test.dart';
part 'objects/block_test.dart';
part 'objects/enemy_test.dart';
part 'objects/gorilla_test.dart';
part 'objects/item_test.dart';
part 'objects/oxygen_test.dart';
part 'objects/player_test.dart';
part 'objects/ship_item_test.dart';
part 'objects/spike_test.dart';

part 'input_manager_test.dart';
part 'object_manager_test.dart';


main() {
  useHtmlConfiguration();
  test("bacon", () {expect(2, equals(1));});
}