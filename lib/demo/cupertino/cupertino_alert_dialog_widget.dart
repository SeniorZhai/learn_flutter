import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoAlertDialogWidget extends StatefulWidget {
  @override
  _CupertinoAlertDialogWidgetState createState() =>
      _CupertinoAlertDialogWidgetState();
}

class _CupertinoAlertDialogWidgetState
    extends State<CupertinoAlertDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CupertinoAlertDialog'),
      ),
      body: Center(
        child: CupertinoButton(
          color: Colors.blue,
          pressedOpacity: 0.4,
          child: Text('显示对话框'),
          onPressed: () {
            showCupertinoDialog(
              context: context,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                  title: new Text("Alert"),
                  content: new Text("My alert message"),
                  actions: [
                    CupertinoDialogAction(
                        isDefaultAction: true,
                        child: new Text("Close"),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .pop("Discard");
                        })
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
