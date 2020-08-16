import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Widget row(String text, Color color, BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(12.5),
    child: Container(
      width: MediaQuery.of(context).size.width * 0.43,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 30, fontFamily: "Roboto_Bold"),
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
