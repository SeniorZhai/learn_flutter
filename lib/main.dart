import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.13),
          splashColor: Colors.white10),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.menu),
                tooltip: 'Navigation',
                onPressed: () => debugPrint('Navigation button is pressed.'),
              ),
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
                  Tab(icon: Icon(Icons.directions_bike))
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                Icon(Icons.local_florist, size: 128.0, color: Colors.black12),
                Icon(Icons.change_history, size: 128.0, color: Colors.black12),
                Icon(Icons.directions_bike, size: 128.0, color: Colors.black12)
              ],
            ),
            drawer: Container(
              color: Colors.white,
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text('This is drawer')],
              ),
            )
            // endDrawer: 右边抽屉
            ));
  }
}
