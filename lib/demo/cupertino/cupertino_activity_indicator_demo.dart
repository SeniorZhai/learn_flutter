import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoActivityIndicatorDemo extends StatefulWidget {
  @override
  _CupertinoActivityIndicatorDemoState createState() =>
      _CupertinoActivityIndicatorDemoState();
}

class _CupertinoActivityIndicatorDemoState
    extends State<CupertinoActivityIndicatorDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CupertinoActivityIndicator'),
          centerTitle: true,
        ),
        body: Center(
            child: Container(
                color: Colors.grey,
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CupertinoActivityIndicator(),
                    CupertinoActivityIndicator(radius: 30.0),
                    CupertinoActivityIndicator(animating: false, radius: 30.0)
                  ],
                ))));
  }
}
