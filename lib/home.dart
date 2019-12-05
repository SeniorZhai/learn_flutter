import 'package:flutter/material.dart';
import './demo/material_components.dart';
import './demo/demo.dart';
import './demo/navigator_demo.dart';
import './demo/animate/animate_demo.dart';
import './demo/form_demo.dart';
import './demo/sunflower_demo.dart';
import './demo/device_info_demo.dart';
import './demo/state_manager_demo.dart';
import './demo/stream_demo.dart';
import './demo/rxdart/rxdart_demo.dart';
import './demo/bloc/bloc_demo.dart';
import './demo/http/http_demo.dart';
import './demo/dio/dio_demo.dart';
import './demo/web_socket_demo.dart';
import './demo/sql/sql_demo.dart';
import './demo/animation/animation_demo.dart';
import './demo/i18n/i18n_demo.dart';
import './demo/provider/provider_demo.dart';
import './demo/painter/painter_demo.dart';
import './demo/qr/qr_demo.dart';
import 'dart:io';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = new List<Widget>()
      ..add(ListItem(title: 'MaterialComponents', page: MaterialComponents()))
      ..add(ListItem(title: 'Demo', page: DemoPage()))
      ..add(ListItem(title: 'About', page: Page(title: 'About')))
      ..add(ListItem(title: 'Animate', page: AnimateDemo()))
      ..add(ListItem(title: 'Navigator', page: NavigatorDemo()))
      ..add(ListItem(title: 'Form', page: FormDemo()))
      ..add(ListItem(title: 'Sunflower', page: SunflowerDemo()))
      ..add(ListItem(title: 'Device info', page: DeviceInfoDemo()))
      ..add(ListItem(title: 'State manager', page: StateManagerDemo()))
      ..add(ListItem(title: 'Stream', page: StreamDemo()))
      ..add(ListItem(title: 'RxDart', page: RxDartDome()))
      ..add(ListItem(title: 'Bloc', page: BlocDemo()))
      ..add(ListItem(title: 'Animation', page: AnimationDemo()))
      ..add(ListItem(title: 'I18n', page: I18nDemo()))
      ..add(ListItem(title: 'Dio', page: DioDemo()))
      ..add(ListItem(title: 'Provider', page: ProviderDemo()))
      ..add(ListItem(title: 'Painter', page: PainterDemo()))
      ..add(ListItem(title: 'Qr', page: QrDemo()))
      ..add(ListItem(title: 'WebSocket', page: WebSocketDemo()));
    if (Platform.isAndroid || Platform.isIOS) {
      list.add(ListItem(title: 'Http', page: HttpDemo()));
      list.add(ListItem(title: 'Sql', page: SqliteDemo()));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter'),
        elevation: 0.0,
      ),
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
