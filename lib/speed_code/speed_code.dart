import 'package:flutter/material.dart';
import './login_page.dart';

class SpeedCode extends StatelessWidget {
  List<Widget> list = new List<Widget>()
    ..add(ListItem(title: 'LoginPage', page: LoginPage()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Speed Code")),
      body: ListView(children: list),
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
