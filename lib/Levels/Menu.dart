import 'package:flutter/material.dart';
import 'levelIcon.dart';
import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:spring_button/spring_button.dart';
import 'package:taqaddam/levelsStorage.dart';

class LevelsMenu extends StatefulWidget {
  @override
  _LevelsMenuState createState() => _LevelsMenuState();
}

class _LevelsMenuState extends State<LevelsMenu> {
  static AudioCache player = AudioCache();
  @override
  // ignore: must_call_super
  void initState() {
    player.loadAll(['Sounds/normal_click.mp3', 'Sounds/normal_click.mp3']);
  }

  @override
  Widget build(BuildContext context) {
    int levelNumber = -2;

    Widget makeRow() {
      levelNumber += 3;
      print(levelNumber.toString());

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          LevelButton(levelNumber),
          LevelButton(levelNumber + 1),
          LevelButton(levelNumber + 2),
        ],
      );
    }

    void prevPage() {
      Navigator.pop(context, '/LevelsMenu');
      player.play('Sounds/normal_click.mp3');
    }

    void menuNext() {
      print("dsf");
      player.play('Sounds/normal_click.mp3');
      Navigator.pushNamed(context, '/ComingSoon');
      setState(() {
//        levelNumber += 3;
      });
    }

    void menuPrev() {
      player.play('Sounds/normal_click.mp3');
      setState(() {
//        levelNumber -= 3;
      });
    }

    Widget buildNavigator() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
//          Container(
//            child: SpringButton(
//              SpringButtonType.OnlyScale,
//              NavDesign(true),
//              onTapDown: (_) => menuPrev(),
//            ),
//          ),
          Container(
            child: SpringButton(
              SpringButtonType.OnlyScale,
              NavDesign(false),
              onTapDown: (_) => menuNext(),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Levels',
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.08,
              fontFamily: 'Roboto_Light',
              letterSpacing: 2),
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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            makeRow(),
            makeRow(),
            makeRow(),
            buildNavigator(),
          ],
        ),
      ),
    );
  }
}
