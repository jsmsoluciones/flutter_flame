import 'package:flutter/material.dart';

import 'lesson01/game_lesson_01.dart';
import 'lesson_02/game_lesson_02.dart';
import 'lesson_menu.dart';
import 'my_game.dart';

class Routes {
  static const menu = '/';
  static const lesson01 = 'lesson01';
  static const lesson02 = 'lesson02';

  static Route routes(RouteSettings setting) {
    MaterialPageRoute buildRoute(Widget widget) {
      return MaterialPageRoute(builder: (context) => widget, settings: setting);
    }

    switch (setting.name) {
      case menu:
        return buildRoute(const LessonMenu());
      case lesson01:
        return buildRoute(MyGameWidget(game: GameLesson01()));
      case lesson02:
        return buildRoute(MyGameWidget(game: GameLesson02()));
      default:
        throw Exception('La ruta no existe');
    }
  }
}
