import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ComingSoon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height *
            0.09), //Setting height of AppBar
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Coming Soon',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.07,
                fontFamily: 'Roboto_Bold'),
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
                fontSize: 30,
                fontFamily: 'Overlock-Black',
              ),
            ),
          )),
    );
  }
}
