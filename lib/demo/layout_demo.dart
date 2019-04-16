import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, // 主轴 空间均分
        crossAxisAlignment: CrossAxisAlignment.stretch, // 交叉轴 拉伸
        children: <Widget>[
          IconBadge(Icons.pool),
          IconBadge(
            Icons.battery_alert,
            size: 64,
          ),
          IconBadge(Icons.airline_seat_flat)
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
