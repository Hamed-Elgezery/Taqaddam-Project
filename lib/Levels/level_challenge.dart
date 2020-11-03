import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spring_button/spring_button.dart';
import 'package:taqaddam/Drawer.dart';
import 'package:taqaddam/Buttons.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:taqaddam/levelsStorage.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class Challenge extends StatefulWidget {
  @override
  _ChallengeState createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {
  static AudioCache player = AudioCache();

  @override
  // ignore: must_call_super
  void initState() {
    player.load('Sounds/normal_click.mp3');
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    List<Color> doneUndoneColors = <Color>[
      Colors.greenAccent,
      Colors.redAccent,
    ];
    List<String> doneUndoneText = <String>[
      'Done!',
      'Undo!',
    ];
    void setPref(int val) async {
      //This part will set that this
      //level is done in shared preference
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('_$level', (val == 1) ? true : false);
    }

    // void next() {
    //   if (level + 1 < levels.length) {
    //     setState(() {
    //       level++;
    //       done = levelsDone[level];
    //     });
    //   } else {
    //     Navigator.popAndPushNamed(context, '/ComingSoon');
    //   }
    // }

    void prevPage() {
      Navigator.popAndPushNamed(context, '/LevelsMenu');
    }

    void completedPressed() {
      player.play('Sounds/completed.mp3');
      levelsDone[level] = 1;
      setState(() {
        done = 1;
      });
      setPref(1);
      prevPage();
    }

    void undo() {
      player.play('Sounds/normal_click.mp3');
      levelsDone[level] = 0;
      setState(() {
        done = 0;
      });
      setPref(0);
      prevPage();
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
                      'Level ' + (level + 1).toString(),
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
                  top: height * 0.08,
                  right: width * 0.04,
                  left: width * 0.04,
                ),
                height: height * 0.3,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: levelsIntro[level],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: width * 0.05,
                        fontFamily: "Roboto_Bold"),
                    children: <TextSpan>[
                      TextSpan(
                        text: levels[level],
                        style: TextStyle(
                            fontFamily: "Overlock-Regular",
                            fontSize: width * 0.04),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: height * 0.1),
                    child: Center(
                      child: SpringButton(
                        SpringButtonType.OnlyScale,
                        ButtonRow(
                            text: doneUndoneText[done],
                            color: doneUndoneColors[done],
                            sizeW: 0.4,
                            sizeH: 0.1),
                        onTapDown: (_) {
                          if (done == 1)
                            undo();
                          else
                            completedPressed();
                        },
                      ),
                    ),
                  ),
                  // Container(
                  //   child: Center(
                  //     child: SpringButton(
                  //       SpringButtonType.OnlyScale,
                  //       ButtonRow(
                  //           text: 'Next!',
                  //           color: Colors.lightBlueAccent,
                  //           sizeW: 0.4,
                  //           sizeH: 0.1),
                  //       onTapDown: (_) => next(),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
