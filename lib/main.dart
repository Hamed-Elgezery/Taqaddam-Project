import 'package:flutter/material.dart';
import 'package:taqaddam/Launch.dart';
import 'package:taqaddam/Levels/Navigator.dart';
import 'package:taqaddam/daily_challenge.dart';
import 'Levels/Navigator.dart';

void main() {
  runApp(MainNav());
}

class MainNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => Menu(),
        '/DailyChallenges': (BuildContext context) => DailyChallenge(),
        '/LevelsMenu': (BuildContext context) => LevelsManager(),
      },
    );
  }
}
