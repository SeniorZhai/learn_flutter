import 'package:flutter/material.dart';

class ClipDemo extends StatefulWidget {
  @override
  _ClipDemoState createState() => _ClipDemoState();
}

class _ClipDemoState extends State<ClipDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clip Demo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              children: <Widget>[
                Chip(
                  label: Text('Life'),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Chip(
                  label: Text('Sunset'),
                  backgroundColor: Colors.orange,
                ),
                SizedBox(
                  width: 8.0,
                ),
                Chip(
                  label: Text('Zhai'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text('蛤'),
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Chip(
                  label: Text('Zhai'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(
                        'https://i2.hdslb.com/bfs/face/3e285abab2a9fd1d52fb640a03f7d458bf139045.jpg@72w_72h.webp'),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  height: 32.0,
                  indent: 32.0,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
