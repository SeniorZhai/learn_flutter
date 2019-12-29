import 'package:flutter/material.dart';
import '../../list_item.dart';
import './animated_container_demo.dart';
import './animate_ball_demo.dart';
import './animation_demo.dart';

class AnimateDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = new List<Widget>()
      ..add(
          ListItem(title: "Animated Container", page: AnimatedContainerDemo()))
      ..add(ListItem(title: 'Animate Ball', page: AnimateBallDemo()))
      ..add(ListItem(title: 'Animation', page: AnimationDemo()));

    return Scaffold(
      appBar: AppBar(
        title: Text('Animate'),
        elevation: 0.0,
      ),
      body: ListView(children: list),
    );
  }
}
