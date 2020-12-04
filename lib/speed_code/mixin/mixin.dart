import 'package:flutter/material.dart';
import './users_generater.dart';
import './user.dart';

class Mixin extends StatefulWidget {
  @override
  _MixinState createState() => _MixinState();
}

class _MixinState extends State<Mixin> {
  List<User> _users;
  initState() {
    _users = UsersGenerater().generate();
  }

  @override
  Widget build(BuildContext context) {
    var a = UsersGenerater().generate();
    print(a.runtimeType);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
                child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      "Mixin",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    )))),
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          Padding(
            child: SizedBox(
                width: 30,
                height: 30,
                child: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        "https://avatars3.githubusercontent.com/u/5416585?s=88&u=5407f225bb7b3e0ed4e6777da339896ebf6d0b6d"))),
            padding: EdgeInsets.all(16),
          ),
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _users.length,
          itemBuilder: (BuildContext context, int index) {
            User u = _users[index];
            return CircleAvatar(
              radius: 48,
            );
          },
        ),
      ),
    );
  }
}
