import 'package:flutter/material.dart';

class CheckBoxDemo extends StatefulWidget {
  @override
  _CheckBoxDemoState createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool _checkBoxItemA = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox'),
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CheckboxListTile(
            value: _checkBoxItemA,
            onChanged: (value) {
              debugPrint('$value');
              setState(() {
                _checkBoxItemA = value;
              });
            },
            title: Text("Checkbox item A"),
            subtitle: Text("Description"),
            secondary: Icon(Icons.bookmark),
            selected: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Checkbox(
                value: _checkBoxItemA,
                onChanged: (value) {},
                activeColor: Colors.black,
              )
            ],
          )
        ],
      ),
    );
  }
}
