import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spring_button/spring_button.dart';
import 'Drawer.dart';
import 'Buttons.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:intl/intl.dart';

class Challenge extends StatefulWidget {
  @override
  _ChallengeState createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {
  var now = new DateTime.now();
  static AudioCache player = AudioCache();

  String daysStreak = '0';
  List<String> title = ["Why don't you go and make someone's day?!\n\n"];
  List<String> challenges = [
    "Write something meaningful on a piece of paper and put it on a random car!"
  ];

  @override
  void initState() {
    player.loadAll(['Sounds/normal_click.mp3', 'Sounds/normal_click.mp3']);
  }

  @override
  Widget build(BuildContext context) {
    void completedPressed() {
      player.play('Sounds/completed.mp3');
    }

    void skipPressed() {
      player.play('Sounds/normal_click.mp3');
      Navigator.pop(context, '/DailyChallenges');
    }

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
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.08),
                height: MediaQuery.of(context).size.height * 0.3,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: title[0],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontFamily: "Roboto_Bold"),
                    children: <TextSpan>[
                      TextSpan(
                        text: challenges[0],
                        style: TextStyle(
                            fontFamily: "Overlock-Regular", fontSize: 20),
                      ),
                    ],
                  ),
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
                      onTapDown: (_) => completedPressed(),
                    ),
                    SpringButton(
                      SpringButtonType.OnlyScale,
                      row('Skip!', Colors.redAccent, context),
                      onTapDown: (_) => skipPressed(),
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
