import 'package:flutter/material.dart';
import '../../list_item.dart';
import './rxdart/rxdart_demo.dart';
import './bloc/bloc_demo.dart';
import './stream_demo.dart';

class AsyncDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = new List<Widget>()
      ..add(ListItem(title: 'Stream', page: StreamDemo()))
      ..add(ListItem(title: 'RxDart', page: RxDartDome()))
      ..add(ListItem(title: 'Bloc', page: BlocDemo()));

    return Scaffold(
      appBar: AppBar(
        title: Text('Layout'),
        elevation: 0.0,
      ),
      body: ListView(children: list),
    );
  }
}
