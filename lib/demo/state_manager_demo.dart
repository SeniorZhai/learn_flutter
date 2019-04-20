import 'package:flutter/material.dart';

class StateManagerDemo extends StatefulWidget {
  @override
  _StateManagerDemoState createState() => _StateManagerDemoState();
}

class _StateManagerDemoState extends State<StateManagerDemo> {
  int _count = 0;
  void _increaseCount() {
    setState(() {
      _count += 1;
    });
    print(_count);
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
        count: _count,
        increaseCount: _increaseCount,
        child: Scaffold(
          appBar: AppBar(
            title: Text('SateManager'),
            elevation: 0.0,
          ),
          body: CounterWrapper(),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              setState(() {
                _count += 1;
              });
              debugPrint('$_count');
            },
          ),
        ));
  }
}

class CounterWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int count = CounterProvider.of(context).count;
    final VoidCallback increaseCount =
        CounterProvider.of(context).increaseCount;
    return ActionChip(
      label: Text('$count'),
      onPressed: increaseCount,
    );
  }
}

class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;
  CounterProvider({
    this.count,
    this.increaseCount,
    this.child,
  }) : super(child: child);
  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
