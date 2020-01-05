import 'package:flutter/material.dart';
import '../../list_item.dart';
import './cupertino_action_sheet_emo.dart';

class CupertinoDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = new List<Widget>()
      ..add(ListItem(title: 'Layout', page: CupertinoActionSheetDemo()));
    return Scaffold(
      appBar: AppBar(
        title: Text('Cupertino'),
        elevation: 0.0,
      ),
      body: ListView(children: list),
    );
  }
}
