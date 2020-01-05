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
              CupertinoButton(
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
                onPressed: () {},
              ),
              CupertinoActionSheetAction(
                child: const Text('🙋 No'),
                onPressed: () {},
              ),
              CupertinoActionSheetAction(
                child: const Text("🙋 Can't say"),
                onPressed: () {},
              ),
              CupertinoActionSheetAction(
                child: const Text("🙋 Decide in next post"),
                onPressed: () {},
              )
            ],
            cancelButton: CupertinoActionSheetAction(
              child: const Text('Cancel'),
              isDefaultAction: true,
              onPressed: () {},
            ))).then<void>((String value) {
      print('$value');
    });
  }
}
