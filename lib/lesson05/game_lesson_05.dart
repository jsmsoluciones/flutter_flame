import 'dart:math';

import 'package:flame/input.dart';

import '../my_game.dart';
import 'objects/ball.dart';
import 'objects/floor.dart';
import 'objects/square.dart';

class GameLesson05 extends MyGame with TapDetector {
  @override
  Future<void>? onLoad() async {
    super.onLoad();
    await loadSprite('ball.png');
    await loadSprite('box.png');
    add(Floor());
  }

  @override
  void onTapDown(TapDownInfo info) {
    super.onTapDown(info);
    if (Random().nextBool()) {
      add(Ball());
    } else {
      add(Square());
    }
  }
}
