library gdp_test;

import 'package:unittest/unittest.dart';
import 'package:unittest/html_config.dart';
import '../game/game.dart';
import '../game/canvas/canvas.dart';
//import 'package:unittest/html_enhanced_config.dart';


part 'animations/sprite_sheet_test.dart';
part 'audio/sound_manager_test.dart';

part 'canvas/camera_test.dart';
part 'canvas/adjusted_context_test.dart';
part 'canvas/canvas_test.dart';

part 'collision/collision_system_test.dart';

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
  test("Testing if value is 2", () {expect(2, equals(1));});
  
  group('Framework,  ', () {
    canvasTest();
    spriteSheetTest();
    collisionSystemTest();
    objectManagerTest();
    
  });
  
  
  group('Object Test Group', () {
    gameObjectTests();
    // run another group
    // etc
  });
  
  
}