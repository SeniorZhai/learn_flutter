import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../list_item.dart';
import './cupertino_action_sheet_emo.dart';
import './cupertino_alert_dialog_widget.dart';
import './cupertino_fullscreen_dialog_transition_demo.dart';
import './cupertino_page_transition_demo.dart';

class CupertinoDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = new List<Widget>()
      ..add(ListItem(
          title: 'CupertinoAlertDialogWidget',
          page: CupertinoAlertDialogWidget()))
      ..add(ListItem(
          title: 'CupertinoActionSheet', page: CupertinoActionSheetDemo()))
      ..add(ListItem(
          title: 'CupertinoFullscreenDialogTransition',
          page: CupertinoFullscreenDialogTransitionDemo()))
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
