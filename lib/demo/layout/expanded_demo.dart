import 'package:flutter/material.dart';

class ExpandedDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Expanded")),
        body: Column(children: <Widget>[
          Container(
              color: Colors.blue[50], width: double.maxFinite, height: 100),
          Expanded(
              flex: 1,
              child: Container(
                  color: Colors.blue[100],
                  width: double.maxFinite,
                  height: 100)),
          Container(
              color: Colors.blue[200], width: double.maxFinite, height: 100),
          Expanded(
              flex: 2,
              child: Container(
                  color: Colors.blue[300],
                  width: double.maxFinite,
                  height: 100))
        ]));
  }
}
