import 'package:flutter/material.dart';
import 'package:taqaddam/Levels/Menu.dart';
import 'package:taqaddam/Levels/coming_soon.dart';
import 'level_challenge.dart';
import 'package:taqaddam/levelsStorage.dart';
import 'coming_soon.dart';

class LevelsManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => ComingSoon(),
        '/Challenge': (BuildContext context) => Challenge(),
        '/ComingSoon': (BuildContext context) => ComingSoon(),
      },
    );
  }
}
