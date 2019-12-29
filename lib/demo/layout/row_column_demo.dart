import 'package:flutter/material.dart';

class RowColumnDemo extends StatefulWidget {
  RowColumnDemo({Key key}) : super(key: key);

  @override
  _RowColumnDemoState createState() => _RowColumnDemoState();
}

class _RowColumnDemoState extends State<RowColumnDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("RowColumn")),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(96, 233, 233, 64)),
                      child: getContent([
                        getCircle(16, Color.fromRGBO(25, 202, 173, 1)),
                        getCircle(28, Color.fromRGBO(140, 199, 181, 1)),
                        getCircle(64, Color.fromRGBO(160, 238, 225, 1)),
                        getCircle(36, Color.fromRGBO(209, 186, 116, 1)),
                        getCircle(24, Color.fromRGBO(230, 206, 172, 1)),
                        getCircle(32, Color.fromRGBO(236, 173, 158, 1)),
                      ]))),
              Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                    Padding(
                        child: Text("Direction"), padding: EdgeInsets.all(8)),
                    RadioListTile(
                        value: 0,
                        groupValue: direction,
                        title: Text("Row"),
                        onChanged: (value) {
                          updateDirection(value);
                        }),
                    RadioListTile(
                        value: 1,
                        groupValue: direction,
                        title: Text("Column"),
                        onChanged: (value) {
                          updateDirection(value);
                        }),
                    Padding(
                        child: Text("MainAxisAlignment"),
                        padding: EdgeInsets.all(8)),
                    RadioListTile(
                        value: 0,
                        groupValue: axisAlignmentValue,
                        title: Text("start"),
                        onChanged: (value) {
                          updateAxisAlignment(value);
                        }),
                    RadioListTile(
                        value: 1,
                        groupValue: axisAlignmentValue,
                        title: Text("center"),
                        onChanged: (value) {
                          updateAxisAlignment(value);
                        }),
                    RadioListTile(
                        value: 2,
                        groupValue: axisAlignmentValue,
                        title: Text("end"),
                        onChanged: (value) {
                          updateAxisAlignment(value);
                        }),
                    RadioListTile(
                        value: 3,
                        groupValue: axisAlignmentValue,
                        title: Text("spaceAround"),
                        onChanged: (value) {
                          updateAxisAlignment(value);
                        }),
                    RadioListTile(
                        value: 4,
                        groupValue: axisAlignmentValue,
                        title: Text("spaceBetween"),
                        onChanged: (value) {
                          updateAxisAlignment(value);
                        }),
                    RadioListTile(
                        value: 5,
                        groupValue: axisAlignmentValue,
                        title: Text("spaceEvenly"),
                        onChanged: (value) {
                          updateAxisAlignment(value);
                        })
                  ]))
            ],
          ),
        ));
  }

  int direction = 0;
  int axisAlignmentValue = 0;

  void updateAxisAlignment(int value) {
    setState(() {
      this.axisAlignmentValue = value;
    });
  }

  void updateDirection(int value) {
    setState(() {
      this.direction = value;
    });
  }

  Widget getContent(List<Widget> children) {
    MainAxisAlignment alignment = MainAxisAlignment.start;
    if (axisAlignmentValue == 0) {
      alignment = MainAxisAlignment.start;
    } else if (axisAlignmentValue == 1) {
      alignment = MainAxisAlignment.center;
    } else if (axisAlignmentValue == 2) {
      alignment = MainAxisAlignment.end;
    } else if (axisAlignmentValue == 3) {
      alignment = MainAxisAlignment.spaceAround;
    } else if (axisAlignmentValue == 4) {
      alignment = MainAxisAlignment.spaceBetween;
    } else {
      alignment = MainAxisAlignment.spaceEvenly;
    }
    if (direction == 0) {
      return Row(mainAxisAlignment: alignment, children: children);
    } else {
      return Column(mainAxisAlignment: alignment, children: children);
    }
  }

  Widget getCircle(double raduis, Color color) {
    return Container(
        width: raduis,
        height: raduis,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(raduis / 2)));
  }
}
