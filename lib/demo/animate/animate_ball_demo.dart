import 'package:flutter/material.dart';
import 'dart:math';

class AnimateBallDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("AnimateBallDemo")), body: AnimateBall(88));
  }
}

class AnimateBall extends StatefulWidget {
  final numberOfDiscs;
  AnimateBall(this.numberOfDiscs);
  @override
  _AnimateBallState createState() => _AnimateBallState();
}

class _AnimateBallState extends State<AnimateBall> {
  final _discs = <DiscData>[];

  @override
  void initState() {
    super.initState();
    _makeDiscs();
  }

  void _makeDiscs() {
    _discs.clear();
    for (int i = 0; i < widget.numberOfDiscs; i++) {
      _discs.add(DiscData());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => setState(() {
              _makeDiscs();
            }),
        child: Stack(children: [
          Center(
              child: Text("Click a disc!",
                  style: TextStyle(color: Colors.black, fontSize: 50))),
          for (final disc in _discs)
            Positioned.fill(
                child: AnimatedAlign(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    alignment: disc.alignment,
                    child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        decoration: BoxDecoration(
                            color: disc.color, shape: BoxShape.circle),
                        height: disc.size,
                        width: disc.size)))
        ]));
  }
}

class DiscData {
  static final _rng = Random();

  double size;
  Color color;
  Alignment alignment;

  DiscData() {
    color = Color.fromARGB(
      _rng.nextInt(200),
      _rng.nextInt(255),
      _rng.nextInt(255),
      _rng.nextInt(255),
    );
    size = _rng.nextDouble() * 40 + 10;
    alignment = Alignment(
      _rng.nextDouble() * 2 - 1,
      _rng.nextDouble() * 2 - 1,
    );
  }
}
