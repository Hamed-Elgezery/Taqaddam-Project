import 'package:flutter/material.dart';
import 'package:spring_button/spring_button.dart';
import 'package:flutter/cupertino.dart';
import 'Drawer.dart';
import 'Buttons.dart';
import 'dart:math';
// import 'package:audioplayers/audio_cache.dart';
import 'levelsStorage.dart';

class Menu extends StatelessWidget {
  // static AudioCache player = AudioCache();

  // void initState() {
  //   player.load('Sounds/normal_click.mp3');
  // }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    void dailyChallenge() {
      Navigator.pushNamed(
          context, (daily.length != 0) ? '/DailyChallenges' : '/Done');
    }

    void levelsPressed() {
      Navigator.pushNamed(context, '/LevelsMenu');
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: CustomPaint(
            painter: CurvePainter(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Welcome\n',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: [width, height].reduce(min) * 0.1,
                          fontFamily: "Roboto_Bold"),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Ready for Some ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: [width, height].reduce(min) * 0.06,
                              fontFamily: "Roboto_Light"),
                        ),
                        TextSpan(
                          text: 'Challenges?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                              fontSize: [width, height].reduce(min) * 0.07,
                              fontFamily: "Roboto_Light"),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SpringButton(
                          SpringButtonType.OnlyScale,
                          ButtonRow(
                              text: "Levels",
                              color: Colors.lightBlueAccent,
                              sizeW: 0.5,
                              sizeH: 0.08),
                          onTapDown: (_) => levelsPressed(),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: height * 0.17),
                          child: FittedBox(
                            child: SpringButton(
                              SpringButtonType.OnlyScale,
                              ButtonRow(
                                  text: "Daily Challenge",
                                  color: Colors.redAccent,
                                  sizeW: 0.5,
                                  sizeH: 0.08),
                              onTapDown: (_) => dailyChallenge(),
                            ),
                          ),
                        ),
                      ],
                    ),
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

///////////////DRAFT////////////////

// Used to align Buttons correctly
// SizedBox(
//   height: MediaQuery.of(context).size.height * 0.22,
// )
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

// PART OF THE SETTINGS FEATURE
//    void settPressed() {
//      player.play('Sounds/normal_click.mp3');
//      print("Settings");
//    }
