import 'package:flutter/material.dart';
import 'package:taqaddam/Launch.dart';
//import 'package:taqaddam/Levels/Navigator.dart';
import 'package:taqaddam/daily_challenge.dart';
import 'Levels/Menu.dart';
import 'Levels/level_challenge.dart';
import 'Levels/coming_soon.dart';
import 'dailyCompleted.dart';

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
        '/LevelsMenu': (BuildContext context) => LevelsMenu(),
        '/Challenge': (BuildContext context) => Challenge(),
        '/ComingSoon': (BuildContext context) => ComingSoon(),
        '/Done': (BuildContext context) => DailyCompleted(),
      },
    );
  }
}
