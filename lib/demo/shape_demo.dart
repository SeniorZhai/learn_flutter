import 'dart:math';

import 'package:flutter/material.dart';

/**
 * flutter很多组件都有shape属性可以控制空间的形状
 * 没有此属性的组件可以使用Clip组件进行裁剪
**/
class ShapeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Shape"),
        ),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Center(
                  child: RaisedButton(
                      onPressed: () {},
                      child: Text("Shape"),
                      shape: BeveledRectangleBorder(
                          side: BorderSide(width: 1, color: Colors.red),
                          borderRadius: BorderRadius.circular(10)))),
              Center(
                  child: RaisedButton(
                      onPressed: () {},
                      child: Text("Shape"),
                      shape: BeveledRectangleBorder(
                          side: BorderSide(width: 1, color: Colors.red),
                          borderRadius: BorderRadius.circular(100)))),
              Center(
                  child: RaisedButton(
                      onPressed: () {},
                      child: Text("Shape"),
                      shape: BeveledRectangleBorder(
                          side: BorderSide(width: 1, color: Colors.red),
                          borderRadius: BorderRadius.circular(0)))),
              Center(
                  child: RaisedButton(
                      onPressed: () {},
                      child: Text("Shape"),
                      shape: Border(
                          top: BorderSide(width: 1, color: Colors.red)))),
              Center(
                  child: RaisedButton(
                      onPressed: () {},
                      child: Text("Shape"),
                      shape: Border(
                        top: BorderSide(color: Colors.red, width: 10),
                        right: BorderSide(color: Colors.blue, width: 10),
                        bottom: BorderSide(color: Colors.yellow, width: 10),
                        left: BorderSide(color: Colors.green, width: 10),
                      ))),
              Center(
                  child: RaisedButton(
                onPressed: () {},
                child: Text("Shape"),
                shape: BorderDirectional(
                  start: BorderSide(color: Colors.red, width: 2),
                  end: BorderSide(color: Colors.blue, width: 2),
                ),
              )),
              Center(
                  child: RaisedButton(
                      onPressed: () {},
                      child: Text("Shape"),
                      shape:
                          CircleBorder(side: BorderSide(color: Colors.red)))),
              Center(
                  child: RaisedButton(
                      onPressed: () {},
                      child: Text("Shape"),
                      shape: ContinuousRectangleBorder(
                          side: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(20)))),
              Center(
                  child: RaisedButton(
                      onPressed: () {},
                      child: Text("Shape"),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10)))),
              Center(
                  child: RaisedButton(
                      onPressed: () {},
                      child: Text("Shape"),
                      shape: StadiumBorder(
                        side: BorderSide(color: Colors.red),
                      ))),
              Center(
                  child: RaisedButton(
                onPressed: () {},
                child: Text("Shape"),
                shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                ),
              )),
              Center(
                  child: RaisedButton(
                onPressed: () {},
                child: Text("Shape"),
                shape: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              )),
              Center(
                  child: ClipRect(
                child: Align(
                  alignment: Alignment.topCenter,
                  heightFactor: 0.5,
                  child: Container(
                    height: 150,
                    width: 150,
                    child: Image.asset(
                      'assets/avatar.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
              Center(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 150,
                        width: 150,
                        child: Image.asset(
                          'assets/avatar.png',
                          fit: BoxFit.cover,
                        ),
                      ))),
              Center(
                  child: ClipOval(
                      child: Container(
                height: 150,
                width: 250,
                child: Image.asset(
                  'assets/avatar.png',
                  fit: BoxFit.cover,
                ),
              ))),
              Center(
                  child: ClipPath.shape(
                      shape: StadiumBorder(),
                      child: Container(
                        height: 150,
                        width: 250,
                        child: Image.asset(
                          'assets/avatar.png',
                          fit: BoxFit.cover,
                        ),
                      ))),
              Center(
                  child: ClipPath(
                      clipper: TrianglePath(),
                      child: Container(
                        height: 150,
                        width: 250,
                        child: Image.asset(
                          'assets/avatar.png',
                          fit: BoxFit.cover,
                        ),
                      ))),
              Center(
                  child: ClipPath(
                      clipper: StarPath(),
                      child: Container(
                        height: 150,
                        width: 250,
                        child: Image.asset(
                          'assets/avatar.png',
                          fit: BoxFit.cover,
                        ),
                      ))),
            ])));
  }
}

class TrianglePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class StarPath extends CustomClipper<Path> {
  StarPath({this.scale = 2.5});

  final double scale;

  double perDegree = 36;

  /// 角度转弧度公式
  double degree2Radian(double degree) {
    return (pi * degree / 180);
  }

  @override
  Path getClip(Size size) {
    var R = min(size.width / 2, size.height / 2);
    var r = R / scale;
    var x = size.width / 2;
    var y = size.height / 2;

    var path = Path();
    path.moveTo(x, y - R);
    path.lineTo(x - sin(degree2Radian(perDegree)) * r,
        y - cos(degree2Radian(perDegree)) * r);
    path.lineTo(x - sin(degree2Radian(perDegree * 2)) * R,
        y - cos(degree2Radian(perDegree * 2)) * R);
    path.lineTo(x - sin(degree2Radian(perDegree * 3)) * r,
        y - cos(degree2Radian(perDegree * 3)) * r);
    path.lineTo(x - sin(degree2Radian(perDegree * 4)) * R,
        y - cos(degree2Radian(perDegree * 4)) * R);
    path.lineTo(x - sin(degree2Radian(perDegree * 5)) * r,
        y - cos(degree2Radian(perDegree * 5)) * r);
    path.lineTo(x - sin(degree2Radian(perDegree * 6)) * R,
        y - cos(degree2Radian(perDegree * 6)) * R);
    path.lineTo(x - sin(degree2Radian(perDegree * 7)) * r,
        y - cos(degree2Radian(perDegree * 7)) * r);
    path.lineTo(x - sin(degree2Radian(perDegree * 8)) * R,
        y - cos(degree2Radian(perDegree * 8)) * R);
    path.lineTo(x - sin(degree2Radian(perDegree * 9)) * r,
        y - cos(degree2Radian(perDegree * 9)) * r);
    path.lineTo(x - sin(degree2Radian(perDegree * 10)) * R,
        y - cos(degree2Radian(perDegree * 10)) * R);
    return path;
  }

  @override
  bool shouldReclip(StarPath oldClipper) {
    return oldClipper.scale != this.scale;
  }
}
