import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoPageTransitionDemo extends StatefulWidget {
  @override
  _CupertinoPageTransitionDemoState createState() =>
      _CupertinoPageTransitionDemoState();
}

class _CupertinoPageTransitionDemoState
    extends State<CupertinoPageTransitionDemo> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);
    animation = Tween(begin: 0.0, end: 2.0).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("CupertinoPageTransition")),
        body: Center(
            child: CupertinoPageTransition(
                primaryRouteAnimation: animation,
                secondaryRouteAnimation: animation,
                child: Text('dasd'),
                linearTransition: true)));
  }
}
