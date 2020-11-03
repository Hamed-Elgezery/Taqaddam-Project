import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ButtonRow extends StatefulWidget {
  const ButtonRow({Key key, this.text, this.sizeW, this.sizeH, this.color})
      : super(key: key);
  final String text;
  final double sizeW;
  final double sizeH;
  final Color color;

  @override
  _ButtonRowState createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var fSize = height * widget.sizeH * 0.4;
    return Padding(
      padding: EdgeInsets.all(12.5),
      child: Container(
        width: width * widget.sizeW,
        height: height * widget.sizeH,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Roboto_Bold",
              fontSize: fSize,
            ),
          ),
        ),
      ),
    );
  }
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
