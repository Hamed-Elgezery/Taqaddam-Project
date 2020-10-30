import 'package:flutter/material.dart';
import 'level_Icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:spring_button/spring_button.dart';

class LevelsMenu extends StatefulWidget {
  @override
  _LevelsMenuState createState() => _LevelsMenuState();
}

class _LevelsMenuState extends State<LevelsMenu> {
  @override
  Widget build(BuildContext context) {
    int levelNumber = -2;
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    Widget makeRow() {
      levelNumber += 3;
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
      Navigator.pop(context);
    }

    void menuNext() {
      Navigator.popAndPushNamed(context, '/ComingSoon');
      // setState(() {
      // levelNumber += 3;
      // });
    }

    void menuPrev() {
      // player.play('Sounds/normal_click.mp3');
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
                        size: width * 0.08,
                      ),
                    ),
                    onPressed: () => prevPage(),
                  ),
                ),
                Center(
                  child: Text(
                    'Levels',
                    style: TextStyle(
                      fontSize: width * 0.08,
                      fontFamily: 'Roboto_Light',
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
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
