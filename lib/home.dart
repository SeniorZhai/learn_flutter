import 'package:flutter/material.dart';
import './list_item.dart';
import './demo/layout/layout_demo.dart';
import './demo/cupertino/cupertino_demo.dart';
import './demo/widget/material_components.dart';
import './demo/demo.dart';
import './demo/navigator_demo.dart';
import './demo/animate/animate_demo.dart';
import './demo/form_demo.dart';
import './demo/sunflower_demo.dart';
import './demo/physics/physics_demo.dart';
import './demo/device_info_demo.dart';
import './demo/state_manager_demo.dart';
import './demo/network/network_demo.dart';
import './demo/async/async_demo.dart';
import './demo/sql/sql_demo.dart';
import './demo/i18n/i18n_demo.dart';
import './demo/provider/provider_demo.dart';
import './demo/painter/painter_demo.dart';
import './demo/qr/qr_demo.dart';
import './demo/game.dart';
import './demo/blur_demo.dart';
import './demo/trial.dart';
import './speed_code/speed_code.dart';
import './demo/shape_demo.dart';
import 'dart:io';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = new List<Widget>()
      ..add(ListItem(title: 'Layout', page: LayoutDemo()))
      ..add(ListItem(title: 'Cupertino', page: CupertinoDemo()))
      ..add(ListItem(title: 'MaterialComponents', page: MaterialComponents()))
      ..add(ListItem(title: 'Navigator', page: NavigatorDemo()))
      ..add(ListItem(title: 'Animate', page: AnimateDemo()))
      ..add(ListItem(title: 'Navigator', page: NavigatorDemo()))
      ..add(ListItem(title: 'Form', page: FormDemo()))
      ..add(ListItem(title: 'Sunflower', page: SunflowerDemo()))
      ..add(ListItem(title: 'Physics', page: PhysicsDemo()))
      ..add(ListItem(title: 'Device info', page: DeviceInfoDemo()))
      ..add(ListItem(title: 'State manager', page: StateManagerDemo()))
      ..add(ListItem(title: 'Async', page: AsyncDemo()))
      ..add(ListItem(title: 'Network', page: NetworkDemo()))
      ..add(ListItem(title: 'I18n', page: I18nDemo()))
      ..add(ListItem(title: 'Provider', page: ProviderDemo()))
      ..add(ListItem(title: 'Painter', page: PainterDemo()))
      ..add(ListItem(title: 'Qr', page: QrDemo()))
      ..add(ListItem(title: 'Game', page: Game()))
      ..add(ListItem(title: 'Blur', page: BlurDemo()))
      ..add(ListItem(title: 'SpeedCode', page: SpeedCode()))
      ..add(ListItem(title: 'Complete', page: DemoPage()))
      ..add(ListItem(title: 'Trial', page: Trial()))
      ..add(ListItem(title: 'Shape', page: ShapeDemo()));
    if (Platform.isAndroid || Platform.isIOS || Platform.isMacOS) {
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
