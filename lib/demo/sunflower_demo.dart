import 'package:flutter/material.dart';
import 'dart:math' as math;

class SunflowerDemo extends StatefulWidget {
  @override
  _SunflowerDemoState createState() => _SunflowerDemoState();
}

class _SunflowerDemoState extends State<SunflowerDemo> {
  double seeds = 100.0;
  int get seedCount => seeds.floor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Sunflower")),
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.transparent)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent)),
                      child: SizedBox(
                          width: 400,
                          height: 400,
                          child: CustomPaint(
                              painter: SunflowerPainter(seedCount)))),
                  Text("Showing $seedCount seeds"),
                  ConstrainedBox(
                      constraints: BoxConstraints.tightFor(width: 300),
                      child: Slider.adaptive(
                        min: 20,
                        max: 2000,
                        value: seeds,
                        onChanged: (newValue) {
                          setState(() {
                            seeds = newValue;
                          });
                        },
                      ))
                ])));
  }
}

class SunflowerPainter extends CustomPainter {
  static const seedRadius = 2.0;
  static const scaleFactor = 4;
  static const tau = math.pi * 2;

  static final phi = (math.sqrt(5) + 1) / 2;

  final int seeds;

  SunflowerPainter(this.seeds);

  @override
  void paint(Canvas canvas, Size size) {
    var center = size.width / 2;
    for (var i = 0; i < seeds; i++) {
      var theta = i * tau / phi;
      var r = math.sqrt(i) * scaleFactor;
      var x = center + r * math.cos(theta);
      var y = center + r * math.sin(theta);
      var offset = Offset(x, y);
      if (!size.contains(offset)) {
        continue;
      }
      drawSeed(canvas, x, y);
    }
  }

  void drawSeed(Canvas canvas, num x, num y) {
    var paint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.fill
      ..color = Colors.orange;
    canvas.drawCircle(Offset(x, y), seedRadius, paint);
  }

  @override
  bool shouldRepaint(SunflowerPainter oldDelegate) {
    return oldDelegate.seeds != this.seeds;
  }
}
