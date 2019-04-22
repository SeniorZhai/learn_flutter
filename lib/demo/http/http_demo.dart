import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
        elevation: 0.0,
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  void initState() {
    super.initState();
    fetchPost();
  }

  fetchPost() async {
    final response = await http
        .get('https://my-json-server.typicode.com/SeniorZhai/test_api/posts');

    print('statusCode: ${response.statusCode}');
    // print('body: ${response.body}');
    final postJsonConverted = json.decode(response.body);
    print(postJsonConverted.length);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
