import '../my_game.dart';
import 'objects/ball.dart';

class GameLesson01 extends MyGame {
  @override
  Future<void>? onLoad() async {
    super.onLoad();
    add(Ball());
  }
}
