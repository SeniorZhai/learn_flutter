import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemo'),
        elevation: 0.0,
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  @override
  void initState() {
    super.initState();
    Observable<String> _observable =
        Observable(Stream.fromIterable(['hello', '你好']));
    // Observable.fromIterable(['hello','你好']);
    // Observable.fromFuture(Future.value('hello');
    // Observable.just('hello');
    Observable.periodic(Duration(seconds: 3), (x) => x.toString());
    _observable.listen(print);
    PublishSubject<String> _subject = PublishSubject<String>();
    _subject.listen((data) => print('listen1: $data'));
    _subject.add('hello');
    _subject.listen((data) => print('listen2: $data'));
    _subject.add('hola');
    _subject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
