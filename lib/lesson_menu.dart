import 'package:flutter/material.dart';

import 'routes.dart';

class LessonMenu extends StatelessWidget {
  const LessonMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: SizedBox(
          width: 350,
          child: ListView(
            children: const [
              SizedBox(height: 32),
              ButtonItem(
                title: 'Lección 1 - Mundo, Cuerpos y Figuras',
                route: Routes.lesson01,
              ),
              ButtonItem(
                title: 'Lección 2 - Tipos de cuerpos',
                route: Routes.lesson02,
              ),
              ButtonItem(
                title: 'Lección 3 - Fricción, densidad y restitución',
                route: Routes.lesson03,
              ),
              ButtonItem(
                title: 'Lección 4 - Fuerzas',
                route: Routes.lesson04,
              ),
              ButtonItem(
                title: 'Lección 5 - Cuerpos y Sprites',
                route: Routes.lesson05,
              ),
              ButtonItem(
                title: 'Lección 6 - Coliciones',
                route: Routes.lesson06,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonItem extends StatelessWidget {
  const ButtonItem({
    super.key,
    required this.title,
    required this.route,
  });

  final String title, route;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(route);
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(title),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
