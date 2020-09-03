import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_size_text/auto_size_text.dart';

Widget row(String text, Color color, double size, BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return Padding(
    padding: EdgeInsets.all(12.5),
    child: Container(
      width: width * size,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
      ),
      child: Center(
        child: AutoSizeText(
          text,
          style: const TextStyle(
              color: Colors.white, fontFamily: "Roboto_Bold", fontSize: 30),
        ),
      ),
    ),
  );
}

Widget settings(BuildContext context) {
  return SafeArea(
    child: Padding(
      padding: EdgeInsets.all(12.5),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.09,
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: const BorderRadius.all(const Radius.circular(20.0)),
        ),
        child: Center(
            child: Icon(
          CupertinoIcons.settings,
          color: Colors.white,
          size: 35,
        )),
      ),
    ),
  );
}
