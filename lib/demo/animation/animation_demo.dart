import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimationDemoHome();
  }
}

class AnimationDemoHome extends StatefulWidget {
  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome>
    with TickerProviderStateMixin {
  AnimationController animationDemoController;
  @override
  void initState() {
    super.initState();
    animationDemoController = AnimationController(
      value: 32.0,
      lowerBound: 0.0,
      upperBound: 100.0,
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    animationDemoController.addListener(() {
      // print('${animationDemoController.value}');
      setState(() {});
    });
    animationDemoController.addStatusListener((AnimationStatus status) {
      print(status);
    });

    // animationDemoController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationDemoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
        elevation: 0.0,
      ),
      body: Center(
        child: IconButton(
          icon: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          iconSize: animationDemoController.value,
          onPressed: () {
            switch (animationDemoController.status) {
              case AnimationStatus.completed:
                animationDemoController.reverse();
                break;
              default:
                animationDemoController.forward();
            }
          },
        ),
      ),
    );
  }
}
