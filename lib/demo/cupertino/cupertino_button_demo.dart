import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoButtonDemo extends StatefulWidget {
  @override
  _CupertinoButtonDemoState createState() => _CupertinoButtonDemoState();
}

class _CupertinoButtonDemoState extends State<CupertinoButtonDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CupertinoButton'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CupertinoButton(
              minSize: 100.0,
              color: Colors.blue,
              pressedOpacity: 0.4,
              child: Text('更改颜色、最小size'),
              onPressed: () {},
            ),
            CupertinoButton(
              color: Colors.blue,
              disabledColor: Colors.grey,
              child: Text('不可点击'),
              onPressed: null,
            ),
            CupertinoButton(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20.0),
              child: Text('更改圆角'),
              onPressed: () {},
            ),
            CupertinoButton(
              padding: EdgeInsets.all(20.0),
              color: Colors.green,
              borderRadius: BorderRadius.circular(20.0),
              child: Text('更改padding'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
