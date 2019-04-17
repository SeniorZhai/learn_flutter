import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool _switchItem = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch'),
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SwitchListTile(
            value: _switchItem,
            onChanged: (value) {
              setState(() {
                _switchItem = value;
              });
            },
            title: Text('Switch item'),
            subtitle: Text('Description'),
            secondary:
                Icon(_switchItem ? Icons.visibility : Icons.visibility_off),
            selected: _switchItem,
          )
          // Text(
          //   _switchItem ? '😁' : '😭',
          //   style: TextStyle(fontSize: 16.0),
          // ),
          // Switch(
          //   value: _switchItem,
          //   onChanged: (value) {
          //     setState(() {
          //       _switchItem = value;
          //     });
          //   },
          // )
        ],
      ),
    );
  }
}
