import 'package:flutter/material.dart';
import 'dart:async';

class AlertDialogDemo extends StatefulWidget {
  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

enum Action { Ok, Cancel }

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  String _choice = 'noting';
  Future<void> _openAlertDialog() async {
    final action = await showDialog(
        // 弹出Dialog
        context: context,
        barrierDismissible: false, // 是否允许点击遮罩关闭
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alert dialog'),
            content: Text('Are you sure about this?'),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context, Action.Cancel);
                },
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.pop(context, Action.Ok);
                },
              )
            ],
          );
        });
    switch (action) {
      case Action.Ok:
        setState(() {
          _choice = 'Ok';
        });
        break;
      case Action.Cancel:
        setState(() {
          _choice = 'Cancel';
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Dialog'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You choice is $_choice'),
            SizedBox(height: 16.0),
            RaisedButton(
              child: Text('show alert'),
              onPressed: _openAlertDialog,
            )
          ],
        ),
      ),
    );
  }
}
