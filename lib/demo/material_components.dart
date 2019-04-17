import 'package:flutter/material.dart';
import './button_demo.dart';
import './floatingbutton_demo.dart';
import './popup_menu.dart';

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
