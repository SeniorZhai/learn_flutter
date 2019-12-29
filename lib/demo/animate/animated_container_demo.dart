import 'package:flutter/material.dart';

class AnimatedContainerDemo extends StatefulWidget {
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    Color color = Color.fromARGB(255, 244, 96, 108);
    Color borderColor = Colors.blue;
    double borderRadius = 10;
    double width = 240;
    double height = 320;
    if (flag) {
      color = Color.fromARGB(255, 236, 173, 158);
      borderColor = Colors.yellow;
      borderRadius = 24;
      width = 320;
      height = 240;
    }
    return Scaffold(
        appBar: AppBar(title: Text("AnimatedContainer")),
        body: Center(
            child: GestureDetector(
                onTap: () => setState(() {
                      flag = !flag;
                    }),
                child: AnimatedContainer(
                    width: width,
                    height: height,
                    curve: Curves.linear,
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(blurRadius: borderRadius)],
                        color: color,
                        borderRadius: BorderRadius.circular(borderRadius),
                        border: Border.all(width: 2.0, color: borderColor)),
                    duration: Duration(milliseconds: 800)))));
  }
}
