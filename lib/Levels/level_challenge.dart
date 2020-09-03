import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spring_button/spring_button.dart';
import 'package:taqaddam/Drawer.dart';
import 'package:taqaddam/Buttons.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:taqaddam/levelsStorage.dart';
import 'dart:io';

// ignore: must_be_immutable
class Challenge extends StatefulWidget {
  @override
  _ChallengeState createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {
  var now = new DateTime.now();
  static AudioCache player = AudioCache();

//  String daysStreak = '0';
//  List<String> title = ["Why don't you go and make someone's day?!\n\n"];
//  List<String> challenges = [
//    "Write something meaningful on a piece of paper and put it on a random car!"
//  ];

  @override
  // ignore: must_call_super
  void initState() {
    player.loadAll(['Sounds/normal_click.mp3', 'Sounds/normal_click.mp3']);
  }

  @override
  Widget build(BuildContext context) {
    void completedPressed() {
      player.play('Sounds/completed.mp3');
      if (level + 1 < levels.length) {
        setState(() {
          level++;
        });
      } else {
        //TODO: Navigate to coming soon
      }
    }

    void backPressed() {
      //TODO: Part of connecting all pages together
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height *
            0.09), //Setting height of AppBar
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: <Widget>[
              Text(
                'Level ' + (level + 1).toString(),
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    fontFamily: 'Roboto_Bold'),
              ),
            ],
          ),
          leading: FlatButton(
            child: Icon(
              CupertinoIcons.back,
              color: Colors.white,
              size: MediaQuery.of(context).size.width * 0.08,
            ),
            onPressed: () => print('Pressed\n'),
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
                    text: levelsIntro[level],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontFamily: "Roboto_Bold"),
                    children: <TextSpan>[
                      TextSpan(
                        text: levels[level],
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
                child: Center(
                  child: SpringButton(
                    SpringButtonType.OnlyScale,
                    row('Completed!', Colors.greenAccent, 0.5, context),
                    onTapDown: (_) => completedPressed(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
