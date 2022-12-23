import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../my_game.dart';
import 'objects/floor.dart';
import 'objects/robot.dart';

class GameLesson08 extends MyGame {
  final robot = Robot();

  @override
  Future<void>? onLoad() async {
    super.onLoad();
    add(Floor());
    add(robot);
  }

  @override
  KeyEventResult onKeyEvent(RawKeyEvent event, Set keysPressed) {
    if (event is RawKeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.keyW) {
        robot.jump();
      }
    }

    if (keysPressed.contains(LogicalKeyboardKey.keyD)) {
      robot.walkRight();
    } else if (keysPressed.contains(LogicalKeyboardKey.keyA)) {
      robot.walkLeft();
    } else if (keysPressed.contains(LogicalKeyboardKey.keyS)) {
      robot.duck();
    } else {
      robot.idle();
    }

    return KeyEventResult.handled;
  }
}
