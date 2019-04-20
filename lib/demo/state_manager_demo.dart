import 'package:flutter/material.dart';

class StateManagerDemo extends StatefulWidget {
  @override
  _StateManagerDemoState createState() => _StateManagerDemoState();
}

class _StateManagerDemoState extends State<StateManagerDemo> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SateManager'),
        elevation: 0.0,
      ),
      body: Counter(_count),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _count += 1;
          });
          debugPrint('$_count');
        },
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final int count;
  Counter(this.count);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Chip(
        label: Text('$count'),
      ),
    );
  }
}
