import 'package:Bandage/speed_code/shop/shop_page.dart';
import 'package:flutter/material.dart';
import './login/login_page.dart';
import '../list_item.dart';
import './story/story_ui.dart';
import './plant/home_screen.dart';

class SpeedCode extends StatelessWidget {
  List<Widget> list = new List<Widget>()
    ..add(ListItem(title: 'Shop', page: ShopPage()))
    ..add(ListItem(title: 'Plant', page: Plant()))
    ..add(ListItem(title: 'LoginPage', page: LoginPage()))
    ..add(ListItem(title: 'StoryUI', page: StoryUI()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Speed Code")),
      body: ListView(children: list),
    );
  }
}
