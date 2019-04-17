import 'package:flutter/material.dart';
import './button_demo.dart';
import './floatingbutton_demo.dart';
import './popup_menu.dart';
import './check_box_demo.dart';
import './radio_demo.dart';
import './switch_demo.dart';
import './slider_demo.dart';
import './date_time_demo.dart';
import './simple_dialog_demo.dart';

class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialComponents'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListItem(
            title: 'Button',
            page: ButtonDemo(),
          ),
          ListItem(
            title: 'FloatingButton',
            page: FloatingActionButtonDemo(),
          ),
          ListItem(
            title: 'PopupMenu',
            page: PopupMenuDemo(),
          ),
          ListItem(
            title: 'CheckBox',
            page: CheckBoxDemo(),
          ),
          ListItem(
            title: 'Radio',
            page: RadioDemo(),
          ),
          ListItem(
            title: 'Switch',
            page: SwitchDemo(),
          ),
          ListItem(
            title: 'Slider',
            page: SliderDemo(),
          ),
          ListItem(
            title: 'DateTime',
            page: DateTimeDemo(),
          ),
          ListItem(
            title: 'SimpleDialog',
            page: SimpleDialogDemo(),
          )
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;
  ListItem({this.title, this.page});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}
