import 'package:flame/game.dart' hide Route;
import 'package:flame_game_1/my_game.dart';
import 'package:flutter/material.dart';

import 'lesson_menu.dart';

class Routes {
  static const menu = '/';
  static const lesson01 = 'lesson01';

  static Route routes(RouteSettings setting) {
    MaterialPageRoute buildRoute(Widget widget) {
      return MaterialPageRoute(builder: (context) => widget, settings: setting);
    }

    switch (setting.name) {
      case menu:
        return buildRoute(const LessonMenu());
      case lesson01:
        return buildRoute(GameWidget(game: MyGame()));
      default:
        throw Exception('La ruta no existe');
    }
  }
}
