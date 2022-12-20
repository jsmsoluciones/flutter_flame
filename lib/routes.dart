import 'package:flutter/material.dart';

import 'lesson_menu.dart';

class Routes {
  static const menu = '/';

  static Route routes(RouteSettings setting) {
    MaterialPageRoute buildRoute(Widget widget) {
      return MaterialPageRoute(builder: (context) => widget, settings: setting);
    }

    switch (setting.name) {
      case menu:
        return buildRoute(const LessonMenu());
      default:
        throw Exception('La ruta no existe');
    }
  }
}
