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
    // fetchPosts().then((list) => {print(list)});
  }

  Future<List<Post>> fetchPosts() async {
    final response = await http
        .get('https://my-json-server.typicode.com/SeniorZhai/test_api/posts');

    print('statusCode: ${response.statusCode}');
    // print('body: ${response.body}');

    final postJsonConverted = json.decode(response.body);
    final list =
        postJsonConverted.map<Post>((item) => Post.fromJson(item)).toList();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchPosts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print('data: ${snapshot.data}');
          print('connectionState: ${snapshot.connectionState}');

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('loading...'),
            );
          }

          return ListView(
            children: snapshot.data.map<Widget>((item) {
              return ListTile(
                title: Text(item.title),
                subtitle: Text(item.author),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(item.imageUrl),
                ),
              );
            }).toList(),
          );
        });
  }
}

class Post {
  final String title;
  final String description;
  final String author;
  final String imageUrl;

  Post(
    this.title,
    this.description,
    this.author,
    this.imageUrl,
  );

  Post.fromJson(Map json)
      : title = json['title'],
        description = json['description'],
        author = json['author'],
        imageUrl = json['imageUrl'];

  Map toJson() => {
        'title': title,
        'descritpion': description,
      };
}
