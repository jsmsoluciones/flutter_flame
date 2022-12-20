import 'package:flame/input.dart';
import 'package:flame_forge2d/forge2d_game.dart';
import 'package:flame_game_1/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'routes.dart';

class MyGame extends Forge2DGame with KeyboardEvents {
  MyGame() : super(zoom: 100, gravity: Vector2(0, 15));

  @override
  KeyEventResult onKeyEvent(RawKeyEvent event, Set keysPressed) {
    if (event is RawKeyDownEvent) {
      if (keysPressed.contains(LogicalKeyboardKey.escape)) {
        navigatorKey.currentState
            ?.pushNamedAndRemoveUntil(Routes.menu, (route) => false);
        return KeyEventResult.handled;
      }
    }
    return KeyEventResult.ignored;
  }

  @override
  Color backgroundColor() => Colors.red;
}
