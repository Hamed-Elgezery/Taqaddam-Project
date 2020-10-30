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

    void setPref() async {
      //This part will set that this
      // level is done in shared preference
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('_$level', true);

      if (level + 1 < levels.length) {
        setState(() {
          level++;
        });
      } else {
        Navigator.popAndPushNamed(context, '/ComingSoon');
      }
    }

    void completedPressed() {
      player.play('Sounds/completed.mp3');
      levelsDone[level] = 1;
      setPref();
    }

    void prevPage() {
      Navigator.popAndPushNamed(context, '/LevelsMenu');
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.09),
        child: AppBar(
          automaticallyImplyLeading: false, // hides leading widget
          flexibleSpace: Center(
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
              Container(
                padding: EdgeInsets.only(top: height * 0.2),
                child: Center(
                  child: SpringButton(
                    SpringButtonType.OnlyScale,
                    row('Done!', Colors.greenAccent, 0.4, 0.1, context),
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
