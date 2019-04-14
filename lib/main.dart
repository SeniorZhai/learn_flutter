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
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Text('zhai',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    accountEmail: Text('deverloper.zhaitao@gmail.com'),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://i1.hdslb.com/bfs/face/3e285abab2a9fd1d52fb640a03f7d458bf139045.jpg@72w_72h.webp'),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.yellow[400],
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                // 颜色滤镜
                                Colors.yellow[400].withOpacity(0.6),
                                BlendMode.hardLight),
                            image: NetworkImage(
                                'http://h.hiphotos.baidu.com/image/h%3D300/sign=575b36d70d3b5bb5a1d726fe06d2d523/a6efce1b9d16fdfad03ef192ba8f8c5494ee7b7f.jpg'))),
                  ),
                  ListTile(
                    title: Text(
                      'Messages',
                      textAlign: TextAlign.right,
                    ),
                    trailing: Icon(
                      Icons.message,
                      color: Colors.black12,
                      size: 22.0,
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                  ListTile(
                    title: Text(
                      'Favorite',
                      textAlign: TextAlign.right,
                    ),
                    trailing: Icon(
                      Icons.favorite,
                      color: Colors.black12,
                      size: 22.0,
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                  ListTile(
                    title: Text(
                      'Settings',
                      textAlign: TextAlign.right,
                    ),
                    trailing: Icon(
                      Icons.settings,
                      color: Colors.black12,
                      size: 22.0,
                    ),
                    onTap: () => Navigator.pop(context), // close drawer
                  )
                ],
              ),
            )
            // endDrawer: 右边抽屉
            ));
  }
}
