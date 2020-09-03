import 'package:flutter/material.dart';
import 'package:spring_button/spring_button.dart';
import 'package:flutter/cupertino.dart';
import 'Drawer.dart';
import 'Buttons.dart';
import 'package:audioplayers/audio_cache.dart';
import 'levelsStorage.dart';

class Menu extends StatelessWidget {
  static AudioCache player = AudioCache();

  void initState() {
    player.load('Sounds/normal_click.mp3');
  }

  @override
  Widget build(BuildContext context) {
    void dailyChallenge() {
      player.play('Sounds/normal_click.mp3');
      if (daily.length != 0) {
        Navigator.pushNamed(context, '/DailyChallenges');
      } else {
        Navigator.pushNamed(context, '/Done');
      }
      print("Start");
    }

    void levelsPressed() {
      Navigator.pushNamed(context, '/LevelsMenu');
    }
// PART OF THE SETTINGS FEATURE
//    void settPressed() {
//      player.play('Sounds/normal_click.mp3');
//      print("Settings");
//    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: CustomPaint(
            painter: CurvePainter(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: 140,
                ),
                Expanded(
                  flex: 1,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Welcome\n',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 50,
                          fontFamily: "Roboto_Bold"),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Ready for Some ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: "Roboto_Light"),
                        ),
                        TextSpan(
                          text: 'Challenges?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                              fontSize: 30,
                              fontFamily: "Roboto_Light"),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SpringButton(
                        SpringButtonType.OnlyScale,
                        row(
                          "Levels",
                          Colors.lightBlueAccent,
                          0.63,
                          context,
                        ),
                        onTapDown: (_) => levelsPressed(),
                      ),
                      SpringButton(
                        SpringButtonType.OnlyScale,
                        row(
                          "Daily Challenge",
                          Colors.redAccent,
                          0.63,
                          context,
                        ),
                        onTapDown: (_) => dailyChallenge(),
                      ),
                      // Used to align Buttons correctly
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.22,
                      )
//SETTING FEATURE REMOVED FOR NOW
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.end,
//                        children: <Widget>[
//                          SpringButton(
//                            SpringButtonType.OnlyScale,
//                            settings(context),
//                            onTapDown: (_) => settPressed(),
//                          ),
//                        ],
//                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
