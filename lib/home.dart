import 'package:flutter/material.dart';
import './demo/material_components.dart';
import './demo/demo.dart';
import './demo/navigator_demo.dart';
import './demo/form_demo.dart';
import './demo/state_manager_demo.dart';
import './demo/stream_demo.dart';
import './demo/rxdart/rxdart_demo.dart';
import './demo/bloc/bloc_demo.dart';
import './demo/http/http_demo.dart';
import './demo/sql/sql_demo.dart';
import './demo/animation/animation_demo.dart';
import './demo/i18n/i18n_demo.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListItem(title: 'MaterialComponents', page: MaterialComponents()),
          ListItem(title: 'Demo', page: DemoPage()),
          ListItem(title: 'About', page: Page(title: 'About')),
          ListItem(title: 'Navigator', page: NavigatorDemo()),
          ListItem(title: 'Form', page: FormDemo()),
          ListItem(title: 'State manager', page: StateManagerDemo()),
          ListItem(title: 'Stream', page: StreamDemo()),
          ListItem(title: 'RxDart', page: RxDartDome()),
          ListItem(title: 'Bloc', page: BlocDemo()),
          ListItem(title: 'Http', page: HttpDemo()),
          ListItem(title: 'Sql', page: SqliteDemo()),
          ListItem(title: 'Animation', page: AnimationDemo()),
          ListItem(title: 'I18n', page: I18nDemo())
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
