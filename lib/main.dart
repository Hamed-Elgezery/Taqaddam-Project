import 'package:flutter/material.dart';
import 'package:taqaddam/Launch.dart';
import 'package:taqaddam/daily_challenge.dart';
import 'package:taqaddam/levelsStorage.dart';
import 'Levels/Menu.dart';
import 'Levels/level_challenge.dart';
import 'Levels/coming_soon.dart';
import 'dailyCompleted.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MainNav());
}

class MainNav extends StatefulWidget {
  @override
  _MainNavState createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  void levels() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < levelsDone.length; i++) {
      bool val = prefs.getBool('_$i');
      if (val == null || val == false)
        levelsDone[i] = 0;
      else
        levelsDone[i] = 1;
    }
  }

  @override
  // ignore: must_call_super
  void initState() {
    levels();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

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
