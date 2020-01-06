import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../list_item.dart';
import './cupertino_button_demo.dart';
import './cupertino_activity_indicator_demo.dart';
import './cupertino_action_sheet_demo.dart';
import './cupertino_alert_dialog_demo.dart';
import './cupertino_switch_demo.dart';
import './cupertino_fullscreen_dialog_transition_demo.dart';
import './cupertino_date_picker_demo.dart';
import './cupertino_page_transition_demo.dart';

class CupertinoDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = new List<Widget>()
      ..add(ListItem(
          title: 'CupertinoActivityIndicator',
          page: CupertinoActivityIndicatorDemo()))
      ..add(ListItem(title: 'CupertinoButton', page: CupertinoButtonDemo()))
      ..add(ListItem(
          title: 'CupertinoAlertDialog', page: CupertinoAlertDialogDemo()))
      ..add(ListItem(
          title: 'CupertinoActionSheet', page: CupertinoActionSheetDemo()))
      ..add(ListItem(
          title: 'CupertinoFullscreenDialogTransition',
          page: CupertinoFullscreenDialogTransitionDemo()))
      ..add(ListItem(title: 'CupertinoSwitch', page: CupertinoSwitchDemo()))
      ..add(ListItem(
          title: 'CupertinoPageTransition',
          page: CupertinoPageTransitionDemo()));
    return Scaffold(
      appBar: AppBar(
        title: Text('Cupertino'),
        elevation: 0.0,
      ),
      body: ListView(children: list),
    );
  }
}
