import 'package:flutter/material.dart';
import '../../list_item.dart';
import './alert_dialog_demo.dart';
import './button_demo.dart';
import './bottom_sheet_demo.dart';
import './check_box_demo.dart';
import './clip_demo.dart';
import './card_demo.dart';
import './date_time_demo.dart';
import './data_table_demo.dart';
import './expansion_panel_demo.dart';
import './floatingbutton_demo.dart';
import './popup_menu.dart';
import './radio_demo.dart';
import './switch_demo.dart';
import './slider_demo.dart';
import './simple_dialog_demo.dart';
import './snack_bar_demo.dart';
import './stepper_demo.dart';
import './opacity_demo.dart';
import './paginated_data_table_demo.dart';
import './dialog.dart';

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
            title: 'AlertDialog',
            page: AlertDialogDemo(),
          ),
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
          ),
          ListItem(
            title: 'Dialog',
            page: DialogDemo(),
          ),
          ListItem(
            title: 'Opacity',
            page: OpacityDemo(),
          ),
          ListItem(
            title: 'BottomSheet',
            page: BottomSheetDemo(),
          ),
          ListItem(
            title: 'Snackbar',
            page: SnackBarDemo(),
          ),
          ListItem(
            title: 'ExpnsionPanel',
            page: ExpansionPanelDemo(),
          ),
          ListItem(
            title: 'Clip',
            page: ClipDemo(),
          ),
          ListItem(
            title: 'DataTable',
            page: DataTableDemo(),
          ),
          ListItem(
            title: 'PaginatedDataTable',
            page: PaginatedDataTableDemo(),
          ),
          ListItem(
            title: 'CardDemo',
            page: CardDemo(),
          ),
          ListItem(
            title: 'Stepper',
            page: StepperDemo(),
          )
        ],
      ),
    );
  }
}
