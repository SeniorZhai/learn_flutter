import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './home.dart';
import './demo/navigator_demo.dart';

import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('zh', 'CN'),
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // '/': (context) => HomePage(),
        '/': (context) => Test(),
        '/about': (context) => Page(title: 'about')
      },
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.13),
          accentColor: Color.fromRGBO(20, 10, 200, 1.0),
          splashColor: Colors.white10),
    );
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        padding: EdgeInsets.all(106.0),
        child: Image.network(
            "https://abiko.loli.net/thumb/?src=http://n.sinaimg.cn/tech/crawl/134/w550h384/20191127/73c8-iixntzz5156241.jpg&w=240&h=180&zc=1"));
  }
}
