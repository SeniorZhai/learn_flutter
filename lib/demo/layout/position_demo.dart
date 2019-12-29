import 'package:flutter/material.dart';

class PositionedDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Positioned")),
        body: Center(
            child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 32,
              left: 32,
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ],
        )));
  }
}
