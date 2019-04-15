import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerDemo();
  }
}

class TextDemo extends StatelessWidget {
  final String _title = '李白';
  @override
  Widget build(BuildContext context) {
    return Text(
      '''$_title -- \n君不见，黄河之水天上来，奔流到海不复回。
君不见，高堂明镜悲白发，朝如青丝暮成雪。人生得意须尽欢，莫使金樽空对月。天生我材必有用，千金散尽还复来。烹羊宰牛且为乐，会须一饮三百杯。
岑夫子，丹丘生，将进酒，杯莫停。与君歌一曲，请君为我倾耳听。钟鼓馔玉不足贵，但愿长醉不复醒。古来圣贤皆寂寞，惟有饮者留其名。
陈王昔时宴平乐，斗酒十千恣欢谑。主人何为言少钱，径须沽取对君酌。五花马，千金裘，呼儿将出换美酒，与尔同销万古愁''',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16.0, color: Colors.black87),
      maxLines: 3,
      overflow: TextOverflow.ellipsis, // 缩略
    );
  }
}

class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'senior',
          style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontSize: 30.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
          children: [
            TextSpan(
                text: 'zhai',
                style: TextStyle(fontSize: 28, color: Colors.blue))
          ]),
    );
  }
}

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(Icons.pool, size: 32.0, color: Colors.white),
            // color: Color.fromRGBO(32, 21, 88, 1.0),
            padding: EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 12),
            margin: EdgeInsets.all(8.0),
            width: 90.0,
            height: 100.0,
            decoration: BoxDecoration(
                color: Color.fromRGBO(32, 21, 88, 1.0),
                border: Border.all(color: Colors.red, width: 3.0),
                // borderRadius: BorderRadius.circular(12.0)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(6.0, 7.0),
                      color: Color.fromRGBO(16, 20, 188, 1.0),
                      blurRadius: 25.0,
                      spreadRadius: -9.0)
                ],
                // gradient: RadialGradient(colors: [
                //   Color.fromRGBO(7, 88, 7, 1.0),
                //   Color.fromRGBO(88, 7, 88, 1.0)
                // ]),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(7, 88, 7, 1.0),
                  Color.fromRGBO(88, 7, 88, 1.0)
                ]),
                shape: BoxShape.circle), // 不能设置圆角
          )
        ],
      ),
    );
  }
}
