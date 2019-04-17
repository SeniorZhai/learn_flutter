import 'package:flutter/material.dart';

class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialComponents'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListItem(
            title: 'Button',
            page: ButtonDemo(),
          ),
          ListItem(
            title: 'FloatingActionButton',
            page: FloatingActionButtonDemo(),
          ),
          ListItem(
            title: 'RaisedButton',
            page: RaisedDemo(),
          ),
          ListItem(
            title: 'OutlineButton',
            page: OutlineButtonDemo(),
          ),
          ListItem(
            title: 'FixedButton',
            page: FixedButtonDemo(),
          ),
          ListItem(
            title: 'ButtonBar',
            page: ButtonBarDemo(),
          )
        ],
      ),
    );
  }
}

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
            Row(
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RaisedDemo extends StatelessWidget {
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
            Row(
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
            )
          ],
        ),
      ),
    );
  }
}

class OutlineButtonDemo extends StatelessWidget {
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
            Row(
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
            )
          ],
        ),
      ),
    );
  }
}

class FixedButtonDemo extends StatelessWidget {
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
            Row(
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
            )
          ],
        ),
      ),
    );
  }
}

class ButtonBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FloatingActionButtonDemo'),
          elevation: 0.0,
        ),
        body: Container(
            padding: EdgeInsets.all(8.0),
            child: Theme(
              data: Theme.of(context).copyWith(
                  buttonTheme: ButtonThemeData(padding: EdgeInsets.all(2.0))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ButtonBar(
                            children: <Widget>[
                              OutlineButton(
                                  child: Text('button'), onPressed: () {}),
                              OutlineButton(
                                  child: Text('button'), onPressed: () {}),
                              OutlineButton(
                                  child: Text('button'), onPressed: () {}),
                              OutlineButton(
                                  child: Text('button'), onPressed: () {})
                            ],
                          )
                        ])
                  ]),
            )));
  }
}

class FloatingActionButtonDemo extends StatelessWidget {
  final Widget _floatingActionButton = FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
    elevation: 0.0,
    backgroundColor: Colors.black87,
    // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
  );
  final Widget _floatingActionButtonExtened = FloatingActionButton.extended(
    onPressed: () {},
    icon: Icon(Icons.add),
    label: Text('Add'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
        elevation: 0.0,
      ),
      floatingActionButton: _floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80.0,
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;
  ListItem({this.title, this.page});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}
