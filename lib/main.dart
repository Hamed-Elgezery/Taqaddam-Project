import 'package:flutter/material.dart';
import 'package:taqaddam/Launch.dart';
import 'package:taqaddam/daily_challenge.dart';

void main() {
  runApp(MainNav());
}

class MainNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Challenge(),
        'DailyChallenges': (context) => null
      },
    );
  }
}
