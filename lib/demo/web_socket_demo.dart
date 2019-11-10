import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketDemo extends StatefulWidget {
  WebSocketChannel channel;

  @override
  _WebSocketDemoState createState() {
    this.channel = new IOWebSocketChannel.connect('ws://echo.websocket.org');
    return _WebSocketDemoState();
  }
}

class _WebSocketDemoState extends State<WebSocketDemo> {
  TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WebSocket')),
      body: new Padding(
          padding: EdgeInsets.all(16),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Form(
                  child: new TextFormField(
                      controller: _controller,
                      decoration:
                          new InputDecoration(labelText: 'Send a message'))),
              new StreamBuilder(
                  stream: widget.channel.stream,
                  builder: (context, snapshot) {
                    return new Padding(
                        padding: EdgeInsets.symmetric(vertical: 24.0),
                        child: new Text(
                            snapshot.hasData ? '${snapshot.data}' : ''));
                  })
            ],
          )),
      floatingActionButton: new FloatingActionButton(
          onPressed: _sendMessage,
          tooltip: 'Send message',
          child: new Icon(Icons.add)),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      widget.channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }
}
