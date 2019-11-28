import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int _radioGroupA = 0;
  void _handleRadioValueChanged(value) {
    setState(() {
      _radioGroupA = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio'),
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('RadioGoupValue $_radioGroupA'),
          RadioListTile(
            value: 0,
            groupValue: _radioGroupA,
            onChanged: _handleRadioValueChanged,
            activeColor: Colors.black,
            title: Text('Option A'),
            subtitle: Text('Description'),
            secondary: Icon(Icons.filter_1),
            selected: _radioGroupA == 0,
          ),
          RadioListTile(
            value: 1,
            groupValue: _radioGroupA,
            onChanged: _handleRadioValueChanged,
            activeColor: Colors.black,
            title: Text('Option B'),
            subtitle: Text('Description'),
            secondary: Icon(Icons.filter_2),
            selected: _radioGroupA == 1,
          ),
          RadioListTile(
            value: 2,
            groupValue: _radioGroupA,
            onChanged: _handleRadioValueChanged,
            activeColor: Colors.black,
            title: Text('Option C'),
            subtitle: Text('Description'),
            secondary: Icon(Icons.filter_3),
            selected: _radioGroupA == 1,
          ),
          // Radio(
          //   value: 0,
          //   groupValue: _radioGroupA,
          //   onChanged: _handleRadioValueChanged,
          //   activeColor: Colors.black,
          // ),
          // Radio(
          //   value: 1,
          //   groupValue: _radioGroupA,
          //   onChanged: _handleRadioValueChanged,
          //   activeColor: Colors.black,
          // ),
        ],
      ),
    );
  }
}
