import '../my_game.dart';
import 'objects/floor.dart';
import 'objects/square.dart';

class GameLesson03 extends MyGame {
  @override
  Future<void>? onLoad() async {
    super.onLoad();
    add(Floor());
    add(Square());
  }
}
