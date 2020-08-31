import 'package:flutter/material.dart';
import 'package:spring_button/spring_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audio_cache.dart';

class ButtonDesign extends StatelessWidget {
  ButtonDesign(this.levelNumber);

  final int levelNumber;
  static AudioCache player = AudioCache();

  @override
  void initState() {
    player.loadAll(['Sounds/normal_click.mp3', 'Sounds/normal_click.mp3']);
  }

  @override
  Widget build(BuildContext context) {
    final Radius radius =
        Radius.circular(MediaQuery.of(context).size.width * 0.1);
    final double fSize = MediaQuery.of(context).size.width * 0.19;

    return Container(
      width: MediaQuery.of(context).size.width * 0.26,
      height: MediaQuery.of(context).size.width * 0.26,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.all(radius),
      ),
      child: Center(
        child: Text(
          levelNumber.toString(),
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

class LevelButton extends StatelessWidget {
  LevelButton(this.levelID);
  final int levelID;
  static AudioCache player = AudioCache();

  @override
  void initState() {
    player.loadAll(['Sounds/normal_click.mp3', 'Sounds/normal_click.mp3']);
  }

  void pressed() {
    player.play('Sounds/normal_click.mp3');
    //TODO: Neavigate to specific level
  }

  @override
  Widget build(BuildContext context) {
    return SpringButton(
      SpringButtonType.OnlyScale,
      ButtonDesign(levelID),
      onTapDown: (_) => pressed(),
    );
  }
}

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
          size: 40,
        ),
      ),
    );
  }
}

class PageNavigator extends StatelessWidget {
  PageNavigator(this.forward);
  bool forward;
  static AudioCache player = AudioCache();

  @override
  void initState() {
    player.loadAll(['Sounds/normal_click.mp3', 'Sounds/normal_click.mp3']);
  }

  void pressed() {
    player.play('Sounds/normal_click.mp3');
    //TODO: Neavigate to specific level
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SpringButton(
        SpringButtonType.OnlyScale,
        NavDesign(forward),
        onTapDown: (_) => pressed(),
      ),
    );
  }
}
