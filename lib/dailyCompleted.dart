import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audio_cache.dart';
import 'levelsStorage.dart';

class DailyCompleted extends StatelessWidget {
  static AudioCache player = AudioCache();

  void initState() {
    player.loadAll(['Sounds/normal_click.mp3', 'Sounds/normal_click.mp3']);
  }

  @override
  Widget build(BuildContext context) {
    void prevPage() {
      daily = [];
      dailyIntro = [];
      Navigator.pop(context, '/Done');
      player.play('Sounds/normal_click.mp3');
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height *
            0.09), //Setting height of AppBar
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Daily Challenge',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.07,
                fontFamily: 'Roboto_Bold'),
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
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.26),
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Center(
            child: Text(
              'Great work!\nYou have done your daily challenge!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 30,
                fontFamily: 'Overlock-Black',
              ),
            ),
          )),
    );
  }
}
