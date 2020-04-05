import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoFullscreenDialogTransitionDemo extends StatefulWidget {
  @override
  _CupertinoFullscreenDialogTransitionDemoState createState() =>
      _CupertinoFullscreenDialogTransitionDemoState();
}

class _CupertinoFullscreenDialogTransitionDemoState
    extends State<CupertinoFullscreenDialogTransitionDemo>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CupertinoFullscreenDialog"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              CupertinoFullscreenDialogTransition(
                linearTransition: true,
                primaryRouteAnimation: _animationController,
                secondaryRouteAnimation: _animationController,
                child: Center(
                  child: Container(
                    color: Colors.blueGrey,
                    width: 300,
                    height: 300,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => _animationController.forward(),
                    child: Text('Forward'),
                  ),
                  RaisedButton(
                    onPressed: () => _animationController.reverse(),
                    child: Text('Reverse'),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    super.initState();
  }
}
