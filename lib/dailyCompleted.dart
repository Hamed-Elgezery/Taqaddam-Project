import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:audioplayers/audio_cache.dart';
import 'levelsStorage.dart';

class DailyCompleted extends StatelessWidget {
  // AudioCache player = AudioCache();

  // void initState() {
  //   player.load('Sounds/normal_click.mp3');
  //   player.play('Sounds/normal_click.mp3');
  // }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    void prevPage() {
      daily = [];
      dailyIntro = [];
      Navigator.pop(context);
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
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Daily Challenge',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.08,
                          fontFamily: 'Roboto_Light',
                          color: Colors.white,
                          letterSpacing: 2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.26),
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Center(
            child: Text(
              'Great work!\nYou have done your daily challenge.\nSee you tomorrow!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.width * 0.06,
                fontFamily: 'Overlock-Black',
              ),
            ),
          )),
    );
  }
}
