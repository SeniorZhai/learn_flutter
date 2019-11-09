import 'package:flutter/material.dart';

class HeroDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Hero')),
        body: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              SizedBox(height: 20.0),
              ListTile(
                leading: GestureDetector(
                  child: Hero(
                    tag:'hero_tag',
                    child: CircleAvatar(backgroundImage: AssetImage('res/images/avatar.png'),),
                  ),
                  onTap: ()=>_showSecondPage(context),
                ),
                  title: Text('Tap'))
            ])));
  }

   void _showSecondPage(BuildContext context) {
     Navigator.of(context).push(MaterialPageRoute(
       builder:(ctx)=>Scaffold(
         appBar: AppBar(title: Text("image")),
         body:Center(child:Hero(
           tag:"hero-tag",
           child:Image.asset('res/images/avatar.png')
         ))
       )
     ));
   }
}
