import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              SizedBox(
                // 固定大小
                width: 120,
                height: 200,
                child: Container(
                  alignment: Alignment(1.0, -1.0), // x y [-1~1] 子部件对齐位置
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(9, 7, 66, 1.0),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Icon(
                    Icons.access_time,
                    color: Colors.white,
                    size: 32.0,
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(9, 7, 66, 1.0),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Icon(
                    Icons.access_time,
                    color: Colors.white,
                    size: 32.0,
                  ),
                ),
              ),
              Positioned(
                //固定位置
                right: 20.0,
                top: 20.0,
                child: Icon(
                  Icons.accessibility_new,
                  color: Colors.white,
                  size: 32.0,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  IconBadge(this.icon, {this.size = 20.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        icon,
        size: size,
        color: Colors.white,
      ),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 34, 1.0),
    );
  }
}
