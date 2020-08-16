import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spring_button/spring_button.dart';
import 'Drawer.dart';
import 'Buttons.dart';
import 'package:intl/intl.dart';

class Challenge extends StatefulWidget {
  @override
  _ChallengeState createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {
  var now = new DateTime.now();
  String daysStreak = '0';
  List<String> challenges = [
    "Why don't you go and make someone's day?!\nWrite something meaningful on a piece of paper and put it on a car!"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height *
            0.09), //Setting height of AppBar
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Daily Challenge',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    fontFamily: 'Roboto_Bold'),
              ),
              Container(
                margin: EdgeInsets.only(left: 60),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'Images/streakUndone.png',
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: MediaQuery.of(context).size.width * 0.1,
                    ),
                    Text(
                      daysStreak,
                      style: TextStyle(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: CustomPaint(
          painter: CurvePainter(),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 75),
                height: 200,
                child: Text(
                  challenges[0],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontFamily: 'Roboto_Light'),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 200),
                margin: EdgeInsets.only(bottom: 60, left: 5),
                child: Row(
                  children: <Widget>[
                    SpringButton(
                      SpringButtonType.OnlyScale,
                      row('Completed!', Colors.greenAccent, context),
                      onTapDown: (_) => print("object"),
                    ),
                    SpringButton(
                      SpringButtonType.OnlyScale,
                      row('Skip!', Colors.redAccent, context),
                      onTapDown: (_) => print(DateTime.now()
                          .difference(DateTime(2020, 9, 7, 17, 30))
                          .inDays),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
