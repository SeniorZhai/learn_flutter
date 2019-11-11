import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import './dio_manager.dart';

class DioDemo extends StatefulWidget {
  @override
  _DioDemoState createState() => _DioDemoState();
}

class _DioDemoState extends State<DioDemo> {
  String data = "no data";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("DioDemo")),
        body: Center(
            child: Column(children: <Widget>[
          Container(
              child: Expanded(
                  child: SingleChildScrollView(
            child: Text("$data", style: TextStyle(color: Colors.black)),
          ))),
          RaisedButton(child: Text("GET"), onPressed: () => getRequst()),
          RaisedButton(child: Text("POST"), onPressed: () => postRequst()),
          RaisedButton(child: Text("PUT"), onPressed: () => putRequst()),
          RaisedButton(child: Text("DELETE"), onPressed: () => deleteRequst())
        ])));
  }

  void getRequst() async {
    Response response = await dio.get('/');
    setState(() {
      data = data + '\n' + response.data;
    });
  }

  void postRequst() async {
    Response response = await dio.post('/');
    setState(() {
      data = data + '\n' + response.data;
    });
  }

  void putRequst() async {
    Response response = await dio.put('/');
    setState(() {
      data = data + '\n' + response.data;
    });
  }

  void deleteRequst() async {
    Response response = await dio.delete('/');
    setState(() {
      data = data + '\n' + response.data;
    });
  }
}
