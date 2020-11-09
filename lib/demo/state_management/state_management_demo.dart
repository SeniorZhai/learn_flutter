import 'package:flutter/material.dart';
import 'package:Bandage/list_item.dart';
import './bloc/bloc_page.dart';

class StateManagementDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = new List<Widget>()
      ..add(ListItem(title: "Bloc", page: BlocPage()));
    return Scaffold(
      appBar: AppBar(
        title: Text("State management"),
      ),
      body: ListView(children: list),
    );
  }
}
