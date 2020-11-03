import 'package:flutter/material.dart';
import 'package:spring_button/spring_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:taqaddam/levelsStorage.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ButtonDesign extends StatefulWidget {
  ButtonDesign(this.levelNumber);

  final int levelNumber;

  @override
  _ButtonDesignState createState() => _ButtonDesignState();
}

class _ButtonDesignState extends State<ButtonDesign> {
  @override
  Widget build(BuildContext context) {
    final Radius radius =
        Radius.circular(MediaQuery.of(context).size.width * 0.1);
    final double fSize = MediaQuery.of(context).size.width * 0.19;

    return Container(
      width: MediaQuery.of(context).size.width * 0.26,
      height: MediaQuery.of(context).size.width * 0.26,
      decoration: BoxDecoration(
        // ignore: unrelated_type_equality_checks
        color: (levelsDone[widget.levelNumber - 1] == 1)
            ? Colors.yellow
            : Colors.blueAccent,
        borderRadius: BorderRadius.all(radius),
      ),
      child: Center(
        child: Text(
          widget.levelNumber.toString(),
          style: TextStyle(
            fontSize: fSize,
            color: Colors.white,
            fontFamily: "Overlock-Bold",
          ),
        ),
      ),
    );
  }
}

class LevelButton extends StatefulWidget {
  LevelButton(this.levelID);
  final int levelID;

  @override
  _LevelButtonState createState() => _LevelButtonState();
}

class _LevelButtonState extends State<LevelButton> {
  @override
  Widget build(BuildContext context) {
    void pressed() {
      level = widget.levelID - 1;
      done = levelsDone[level];
      Navigator.popAndPushNamed(context, '/Challenge');
    }

    return SpringButton(
      SpringButtonType.OnlyScale,
      ButtonDesign(widget.levelID),
      onTapDown: (_) => pressed(),
    );
  }
}

// ignore: must_be_immutable
class NavDesign extends StatelessWidget {
  NavDesign(this.forward);

  bool forward;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.3;
    final height = MediaQuery.of(context).size.height * 0.1;
    final Radius rad = Radius.circular(10);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(rad),
      ),
      child: Center(
        child: Icon(
          (forward)
              ? CupertinoIcons.left_chevron
              : CupertinoIcons.right_chevron,
          color: Colors.white,
          size: height,
        ),
      ),
    );
  }
}
