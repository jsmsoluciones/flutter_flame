import 'package:flutter/material.dart';

import 'routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    navigatorKey: navigatorKey,
    onGenerateRoute: Routes.routes,
  ));
}
