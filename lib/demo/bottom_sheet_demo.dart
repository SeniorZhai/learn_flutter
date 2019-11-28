import 'package:flutter/material.dart';
import 'dart:async';

class BottomSheetDemo extends StatefulWidget {
  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();
  _openBottomSheet() {
    _bottomSheetScaffoldKey.currentState
        .showBottomSheet((BuildContext context) {
      return BottomAppBar(
        child: Container(
          height: 90.0,
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Icon(Icons.pause_circle_outline),
              SizedBox(
                width: 16.0,
              ),
              Text("01:30 / 03:30"),
              Expanded(
                child: Text(
                  "Fix you - Coldplay",
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Future<void> _openModelBottomSheet() async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('OptionA'),
                  onTap: () {
                    Navigator.pop(context, 'A');
                  },
                ),
                ListTile(
                  title: Text('OptionB'),
                  onTap: () {
                    Navigator.pop(context, 'B');
                  },
                ),
                ListTile(
                  title: Text('OptionC'),
                  onTap: () {
                    Navigator.pop(context, 'C');
                  },
                )
              ],
            ),
          );
        });

    debugPrint(option);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffoldKey,
      appBar: AppBar(
        title: Text('BottomSheet'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('open bottomsheet'),
                  onPressed: _openBottomSheet,
                ),
                FlatButton(
                  child: Text('model bottomsheet'),
                  onPressed: _openModelBottomSheet,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
