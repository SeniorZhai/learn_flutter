import 'package:flutter/material.dart';
import './list_demo.dart';
import './basic_demo.dart';
import './layout_demo.dart';
import './widget/sliver_demo.dart';
import './drawer_demo.dart';
import './bottom_navagation_demo.dart';

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              title: Text('World'),
              elevation: 12.0,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  tooltip: 'Search',
                  onPressed: () => debugPrint('Search button is pressed.'),
                )
              ],
              bottom: TabBar(
                unselectedLabelColor: Colors.black38,
                indicatorColor: Colors.black54,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 1.0,
                tabs: <Widget>[
                  Tab(icon: Icon(Icons.local_florist)),
                  Tab(icon: Icon(Icons.change_history)),
                  Tab(icon: Icon(Icons.directions_bike)),
                  Tab(icon: Icon(Icons.view_quilt)),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                ListViewDome(),
                BasicDemo(),
                LayoutDemo(),
                SliverDemo()
              ],
            ),
            drawer: DrawerDemo(),
            // endDrawer: 右边抽屉
            bottomNavigationBar: BottomNavagationDemo()));
  }
}
