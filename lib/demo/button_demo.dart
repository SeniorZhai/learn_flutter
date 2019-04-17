import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedDemo(),
            FlatButtonDemo(),
            RaisedDemo(),
            OutlineButtonDemo(),
            FixedButtonDemo(),
            ButtonBarDemo()
          ],
        ),
      ),
    );
  }
}

class FlatButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
        FlatButton.icon(
          icon: Icon(Icons.add),
          label: Text('button'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
        FlatButton.icon(
          icon: Icon(Icons.add),
          label: Text('button'),
          onPressed: null,
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        )
      ],
    );
  }
}

class RaisedDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey,
          elevation: 0.0,
          color: Theme.of(context).accentColor,
          textColor: Colors.white,
          shape: StadiumBorder(),
        ),
        SizedBox(
          width: 12.0,
        ),
        RaisedButton.icon(
          icon: Icon(Icons.add),
          label: Text('button'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        )
      ],
    );
  }
}

class OutlineButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        OutlineButton(
          child: Text('Button'),
          onPressed: () {},
          splashColor: Colors.red[100],
          borderSide: BorderSide(color: Colors.red),
          color: Theme.of(context).accentColor,
          textColor: Colors.black,
          shape: StadiumBorder(),
          highlightedBorderColor: Colors.grey,
        ),
        SizedBox(
          width: 12.0,
        ),
        OutlineButton.icon(
          icon: Icon(Icons.add),
          label: Text('button'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        )
      ],
    );
  }
}

class FixedButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          // 占据所有可用空间
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.red[100],
            borderSide: BorderSide(color: Colors.red),
            color: Theme.of(context).accentColor,
            textColor: Colors.black,
            shape: StadiumBorder(),
            highlightedBorderColor: Colors.grey,
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          flex: 2,
          // 占据所有可用空间
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.red[100],
            borderSide: BorderSide(color: Colors.red),
            color: Theme.of(context).accentColor,
            textColor: Colors.black,
            shape: StadiumBorder(),
            highlightedBorderColor: Colors.grey,
          ),
        )
      ],
    );
  }
}

class ButtonBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      ButtonBar(
        children: <Widget>[
          OutlineButton(child: Text('button'), onPressed: () {}),
          OutlineButton(child: Text('button'), onPressed: () {}),
          OutlineButton(child: Text('button'), onPressed: () {}),
          OutlineButton(child: Text('button'), onPressed: () {})
        ],
      )
    ]);
  }
}
