import 'package:flutter/material.dart';
import 'dart:io';
import '../../list_item.dart';
import './dio_demo.dart';
import './http/http_demo.dart';
import './web_socket_demo.dart';

class NetworkDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = new List<Widget>()
      ..add(ListItem(title: 'Dio', page: DioDemo()))
      ..add(ListItem(title: 'Websocket', page: WebSocketDemo()));
    if (Platform.isAndroid || Platform.isIOS) {
      list.add(ListItem(title: 'Http', page: HttpDemo()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Layout'),
        elevation: 0.0,
      ),
      body: ListView(children: list),
    );
  }
}
