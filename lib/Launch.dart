import 'package:flutter/material.dart';
import 'package:spring_button/spring_button.dart';
import 'package:flutter/cupertino.dart';
import 'Drawer.dart';
import 'Buttons.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: CustomPaint(
            painter: CurvePainter(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: 140,
                ),
                Expanded(
                  flex: 1,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Welcome\n',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 50,
                          fontFamily: "Roboto_Bold"),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Ready for Some ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: "Roboto_Light"),
                        ),
                        TextSpan(
                          text: 'Challenges?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                              fontSize: 30,
                              fontFamily: "Roboto_Light"),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SpringButton(
                        SpringButtonType.OnlyScale,
                        row(
                          "Start",
                          Colors.lightBlueAccent,
                          context,
                        ),
                        onTapDown: (_) => print("object"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          SpringButton(
                            SpringButtonType.OnlyScale,
                            settings(context),
                            onTapDown: (_) => print("object"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
