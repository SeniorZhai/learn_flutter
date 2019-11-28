import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './counter_model.dart';

class ProviderDemo extends StatefulWidget {
  @override
  _ProviderDemoState createState() => _ProviderDemoState();
}

class _ProviderDemoState extends State<ProviderDemo> {
  final counter = CounterModel();
  final textSize = 24;

  @override
  Widget build(BuildContext context) {
    return Provider<int>.value(
        value: textSize,
        child: ChangeNotifierProvider.value(
          value: counter,
          child: MaterialApp(
            home: FirstScreen(),
          ),
        ));
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 获取顶层数据
    final _counter = Provider.of<CounterModel>(context);
    final textSize = Provider.of<int>(context).toDouble();
    print(textSize);
    return Scaffold(
      appBar: AppBar(title: Text('FirstPage')),
      body: Center(
          child: Text('Value: ${_counter.value}',
              style: TextStyle(fontSize: textSize))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SecondPage())),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      // 使用Consumer
      body: Consumer2<CounterModel, int>(
        builder: (context, CounterModel counter, int textSize, _) => Center(
          child: Text(
            'Value: ${counter.value}',
            style: TextStyle(
              fontSize: textSize.toDouble(),
            ),
          ),
        ),
      ),
      floatingActionButton: Consumer<CounterModel>(
        builder: (context, CounterModel counter, child) => FloatingActionButton(
          onPressed: counter.increment,
          child: child,
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
