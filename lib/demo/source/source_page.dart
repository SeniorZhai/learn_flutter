import 'package:flutter/material.dart';
import '../../list_item.dart';

class SourcePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = new List<Widget>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Layout'),
        elevation: 0.0,
      ),
      body: ListView(children: list),
    );
  }
}
