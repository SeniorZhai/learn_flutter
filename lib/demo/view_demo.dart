import 'package:flutter/material.dart';

class ViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      // pageSnapping: false, // 页停留效果
      reverse: true, // 倒序
      onPageChanged: (index) => debugPrint('$index'), // 回调
      controller: PageController(
          initialPage: 1, keepPage: false, viewportFraction: 0.80 // 页占显示区域的比例),
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Container(
          color: Colors.brown[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            "one",
            style: TextStyle(color: Colors.white, fontSize: 32.0),
          ),
        ),
        Container(
          color: Colors.brown[700],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            "two",
            style: TextStyle(color: Colors.white, fontSize: 32.0),
          ),
        ),
        Container(
          color: Colors.brown[400],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            "three",
            style: TextStyle(color: Colors.white, fontSize: 32.0),
          ),
        )
      ],
    );
  }
}
