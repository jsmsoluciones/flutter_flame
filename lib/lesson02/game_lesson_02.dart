import '../my_game.dart';
import 'objects/ball_dynamic.dart';
import 'objects/box_kynematic.dart';
import 'objects/floor_static.dart';

class GameLesson02 extends MyGame {
  @override
  Future<void>? onLoad() async {
    super.onLoad();
    add(FloorStatic());
    add(BoxKynematic());
    add(BallDynamic());
  }
}
