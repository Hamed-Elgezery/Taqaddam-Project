import 'package:flutter/material.dart';
import 'levelIcon.dart';
import 'package:flutter/cupertino.dart';

class LevelsMenu extends StatefulWidget {
  @override
  _LevelsMenuState createState() => _LevelsMenuState();
}

class _LevelsMenuState extends State<LevelsMenu> {
  @override
  Widget build(BuildContext context) {
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
          onPressed: () => print('Pressed\n'),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                LevelButton(1),
                LevelButton(2),
                LevelButton(3),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                LevelButton(4),
                LevelButton(5),
                LevelButton(6),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                LevelButton(7),
                LevelButton(8),
                LevelButton(9),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                PageNavigator(true),
                PageNavigator(false),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
