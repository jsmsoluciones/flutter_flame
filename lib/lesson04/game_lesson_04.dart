import 'package:flame/input.dart';

import '../my_game.dart';
import 'objects/ball.dart';
import 'objects/floor.dart';

class GameLesson04 extends MyGame with TapDetector {
  final balls = [Ball(2), Ball(6), Ball(10)];
  final speed = Vector2(0, -9);

  @override
  Future<void>? onLoad() async {
    super.onLoad();
    add(Floor());
    addAll(balls);
  }

  @override
  void onTapDown(TapDownInfo info) {
    super.onTapDown(info);
    balls[0].body.applyForce(speed);
    balls[1].body.applyLinearImpulse(speed);
    balls[2].body.linearVelocity = speed;
  }
}
