import 'package:flutter/material.dart';

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
              ButtonItem(title: 'Lección 1', route: 'route')
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