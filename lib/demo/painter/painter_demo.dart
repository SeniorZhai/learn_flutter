import 'package:flutter/material.dart';
import 'dart:math';

class PainterDemo extends StatefulWidget {
  @override
  _PainterDemoState createState() => _PainterDemoState();
}

class _PainterDemoState extends State<PainterDemo> {
  double percentage;
  @override
  void initState() {
    super.initState();
    setState(() {
      percentage = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text("Painter")),
        body: Center(
          child: new Container(
            height: 200.0,
            width: 200.0,
            child: new CustomPaint(
              foregroundPainter: new MyPainter(
                  lineColor: Colors.amber,
                  completeColor: Colors.blueAccent,
                  completePercent: percentage,
                  width: 8.0),
              child: new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new RaisedButton(
                    color: Colors.purple,
                    splashColor: Colors.blueAccent,
                    shape: new CircleBorder(),
                    child: new Text("Click"),
                    onPressed: () {
                      setState(() {
                        percentage += 10.0;
                        if (percentage > 100.0) {
                          percentage = 0.0;
                        }
                      });
                    }),
              ),
            ),
          ),
        ));
  }
}

class MyPainter extends CustomPainter {
  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;
  MyPainter(
      {this.lineColor, this.completeColor, this.completePercent, this.width});

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint complete = new Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, line);
    double arcAngle = 2 * pi * (completePercent / 100);
    canvas.drawArc(new Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, complete);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
