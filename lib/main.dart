import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './home.dart';
import './demo/navigator_demo.dart';

import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/cupertino.dart';
import './demo/state_management/bloc/counter_observer.dart';
import 'package:bloc/bloc.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  Bloc.observer = CounterObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        const FallbackCupertinoLocalisationsDelegate() // Fix CupertinoAlertDialog crash
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('zh', 'CN'),
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/about': (context) => MyPage(title: 'about')
      },
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.13),
          accentColor: Color.fromRGBO(20, 10, 200, 1.0),
          splashColor: Colors.white10),
    );
  }
}

class FallbackCupertinoLocalisationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalisationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      DefaultCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(FallbackCupertinoLocalisationsDelegate old) => false;
}
