import 'package:flutter/material.dart';

class FlexDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Flex")),
        body: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getCircle(16, Color.fromRGBO(25, 202, 173, 1)),
              getCircle(28, Color.fromRGBO(140, 199, 181, 1)),
              getCircle(64, Color.fromRGBO(160, 238, 225, 1)),
              getCircle(36, Color.fromRGBO(209, 186, 116, 1)),
              getCircle(24, Color.fromRGBO(230, 206, 172, 1))
            ]));
  }

  Widget getCircle(double raduis, Color color) {
    return Container(
        width: raduis,
        height: raduis,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(raduis / 2)));
  }
}
