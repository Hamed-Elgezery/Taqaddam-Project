import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spring_button/spring_button.dart';
import 'Drawer.dart';
import 'Buttons.dart';
import 'package:audioplayers/audio_cache.dart';
import 'levelsStorage.dart';

class DailyChallenge extends StatefulWidget {
  @override
  _DailyChallengeState createState() => _DailyChallengeState();
}

class _DailyChallengeState extends State<DailyChallenge> {
  static AudioCache player = AudioCache();

  @override
  // ignore: must_call_super
  void initState() {
    player.loadAll(['Sounds/normal_click.mp3', 'Sounds/normal_click.mp3']);
  }

  @override
  Widget build(BuildContext context) {
    void completedPressed() {
      player.play('Sounds/completed.mp3');
      Navigator.popAndPushNamed(context, '/Done');
    }

    void switchPressed() {
      player.play('Sounds/normal_click.mp3');
      setState(() {
        dailyNum++;
        dailyNum %= daily.length;
      });
    }

    void prevPage() {
      Navigator.pop(context, '/DailyChallenges');
      player.play('Sounds/normal_click.mp3');
    }

    if (daily.length == 0) {
      Navigator.popAndPushNamed(context, '/Done');
    } else {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height *
              0.09), //Setting height of AppBar
          child: AppBar(
            title: Row(
              children: <Widget>[
                Text(
                  'Daily Challenge',
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
              onPressed: () => prevPage(),
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
                      text: dailyIntro[dailyNum],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: "Roboto_Bold"),
                      children: <TextSpan>[
                        TextSpan(
                          text: daily[dailyNum],
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SpringButton(
                        SpringButtonType.OnlyScale,
                        row('Completed!', Colors.greenAccent, 0.43, context),
                        onTapDown: (_) => completedPressed(),
                      ),
                      SpringButton(
                        SpringButtonType.OnlyScale,
                        row('Switch!', Colors.lightBlueAccent, 0.43, context),
                        onTapDown: (_) => switchPressed(),
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
}

//Container(
//                margin: EdgeInsets.only(left: 60),
//                child: Column(
//                  children: <Widget>[
//                    Image.asset(
//                      'Images/streakUndone.png',
//                      width: MediaQuery.of(context).size.width * 0.1,
//                      height: MediaQuery.of(context).size.width * 0.1,
//                    ),
//                    Text(
//                      daysStreak,
//                      style: TextStyle(),
//                    ),
//                  ],
//                ),
//              )
//            ],
//          ),
