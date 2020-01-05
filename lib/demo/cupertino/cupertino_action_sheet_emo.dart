import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoActionSheetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Cupertino ActionSheet")),
        body: Container(
            width: double.maxFinite,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              RaisedButton(
                  color: Colors.blue[200],
                  child: Text("click"),
                  onPressed: () => {showSheet(context)})
            ])));
  }

  void showSheet(BuildContext context) {
    showCupertinoModalPopup<String>(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
            title: const Text('Choose frankly 😊'),
            message: const Text('Your options are '),
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: const Text('🙋 Yes'),
                onPressed: () {
                  Navigator.pop(context, '🙋 Yes');
                },
              ),
              CupertinoActionSheetAction(
                child: const Text('🙋 No'),
                onPressed: () {
                  Navigator.pop(context, '🙋 No');
                },
              ),
              CupertinoActionSheetAction(
                child: const Text("🙋 Can't say"),
                onPressed: () {
                  Navigator.pop(context, "🙋 Can't say");
                },
              ),
              CupertinoActionSheetAction(
                child: const Text("🙋 Decide in next post"),
                onPressed: () {
                  Navigator.pop(context, "🙋 Decide in next post");
                },
              )
            ],
            cancelButton: CupertinoActionSheetAction(
              child: const Text('Cancel'),
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context, 'Cancel');
              },
            ))).then<void>((String value) => {
          Scaffold.of(context).showSnackBar(new SnackBar(
            content: new Text('You clicked $value'),
            duration: Duration(milliseconds: 800),
          ))
        });
  }
}
