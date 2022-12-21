import 'package:flutter/material.dart';

import 'lesson_menu.dart';
import 'my_game.dart';

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
        return buildRoute(MyGameWidget(game: MyGame()));
      default:
        throw Exception('La ruta no existe');
    }
  }
}
