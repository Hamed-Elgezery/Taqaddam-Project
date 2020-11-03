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
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

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
      Navigator.pop(context);
    }

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.09),
          child: AppBar(
            automaticallyImplyLeading: false, // hides leading widget
            flexibleSpace: Center(
              child: Container(
                margin: EdgeInsets.only(top: height * 0.04),
                child: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: FlatButton(
                        child: Container(
                          child: Icon(
                            CupertinoIcons.back,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width * 0.08,
                          ),
                        ),
                        onPressed: () => prevPage(),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Daily Challenge',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.08,
                            fontFamily: 'Roboto_Light',
                            color: Colors.white,
                            letterSpacing: 2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Container(
          width: width,
          color: Colors.white,
          child: CustomPaint(
            painter: CurvePainter(),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    top: height * 0.05,
                    right: width * 0.04,
                    left: width * 0.04,
                  ),
                  height: height * 0.3,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: dailyIntro[dailyNum],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: width * 0.05,
                          fontFamily: "Roboto_Bold"),
                      children: <TextSpan>[
                        TextSpan(
                          text: daily[dailyNum],
                          style: TextStyle(
                              fontFamily: "Overlock-Regular",
                              fontSize: width * 0.04),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SpringButton(
                        SpringButtonType.OnlyScale,
                        ButtonRow(
                            text: 'Completed!',
                            color: Colors.greenAccent,
                            sizeW: 0.4,
                            sizeH: 0.1),
                        onTapDown: (_) => completedPressed(),
                      ),
                      SpringButton(
                        SpringButtonType.OnlyScale,
                        ButtonRow(
                            text: 'Switch!',
                            color: Colors.lightBlueAccent,
                            sizeW: 0.4,
                            sizeH: 0.1),
                        onTapDown: (_) => switchPressed(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
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
