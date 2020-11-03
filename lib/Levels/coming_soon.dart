import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:audioplayers/audio_cache.dart';

class ComingSoon extends StatelessWidget {
  // static AudioCache player = AudioCache();
  //
  // void initState() {
  //   player.loadAll(['Sounds/normal_click.mp3', 'Sounds/normal_click.mp3']);
  //   player.play('Sounds/normal_click.mp3');
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    void prevPage() {
      Navigator.popAndPushNamed(context, '/LevelsMenu');
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
                      'Coming Soon',
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
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.26),
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Center(
            child: Text(
              'We hope you are enjoying!\nNew Levels Coming Soon!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.width * 0.08,
                fontFamily: 'Overlock-Black',
              ),
            ),
          )),
    );
  }
}
