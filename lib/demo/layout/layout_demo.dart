import 'package:flutter/material.dart';
import '../../list_item.dart';
import './row_column_demo.dart';
import './wrap_demo.dart';
import './align_demo.dart';
import './expanded_demo.dart';
import './position_demo.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = new List<Widget>()
      ..add(ListItem(title: 'Row & Column', page: RowColumnDemo()))
      ..add(ListItem(title: 'Align', page: AlignDemo()))
      ..add(ListItem(title: 'Expanded', page: ExpandedDemo()))
      ..add(ListItem(title: 'Positioned', page: PositionedDemo()))
      ..add(ListItem(title: 'Wrap', page: WrapDemo()));

    return Scaffold(
      appBar: AppBar(
        title: Text('Layout'),
        elevation: 0.0,
      ),
      body: ListView(children: list),
    );
  }
}
