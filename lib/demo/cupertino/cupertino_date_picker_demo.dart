import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoDatePickerDemo extends StatefulWidget {
  @override
  _CupertinoDatePickerDemoState createState() =>
      _CupertinoDatePickerDemoState();
}

class _CupertinoDatePickerDemoState extends State<CupertinoDatePickerDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("CupertinoDatePicker")),
        body: Center(
            child: MaterialButton(
          child: Text(
            "Cupertino date Picker",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.redAccent,
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext builder) {
                  return Container(
                      height: MediaQuery.of(context).copyWith().size.height / 3,
                      child: CupertinoDatePicker(
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (DateTime newdate) {
                          print(newdate);
                        },
                        use24hFormat: true,
                        maximumDate: new DateTime(2020, 12, 30),
                        minimumYear: 2010,
                        maximumYear: 2020,
                        minuteInterval: 1,
                        mode: CupertinoDatePickerMode.dateAndTime,
                      ));
                });
          },
        )));
  }
}
