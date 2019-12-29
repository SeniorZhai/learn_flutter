import 'package:flutter/material.dart';

class OpacityDemo extends StatefulWidget {
  @override
  _OpacityDemoState createState() => _OpacityDemoState();
}

class _OpacityDemoState extends State<OpacityDemo> {
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    double opacity = 1;
    if (!flag) {
      opacity = 0.1;
    }
    return Scaffold(
        appBar: AppBar(title: Text("Opacity")),
        body: GestureDetector(
          onTap: () => setState(() {
            flag = !flag;
          }),
          child: Column(
            children: <Widget>[
              Container(
                  color: Colors.green[100],
                  width: double.maxFinite,
                  height: 64),
              Container(
                  color: Colors.green[200],
                  width: double.maxFinite,
                  height: 64),
              Opacity(
                  opacity: opacity,
                  child: Container(
                      color: Colors.red[300],
                      width: double.maxFinite,
                      height: 64)),
              AnimatedOpacity(
                  opacity: opacity,
                  duration: Duration(milliseconds: 300),
                  child: Container(
                      color: Colors.red[200],
                      width: double.maxFinite,
                      height: 64)),
              Container(
                  color: Colors.green[400],
                  width: double.maxFinite,
                  height: 64),
            ],
          ),
        ));
  }
}
