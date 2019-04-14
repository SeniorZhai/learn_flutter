import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName:
                Text('zhai', style: TextStyle(fontWeight: FontWeight.bold)),
            accountEmail: Text('deverloper.zhaitao@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i1.hdslb.com/bfs/face/3e285abab2a9fd1d52fb640a03f7d458bf139045.jpg@72w_72h.webp'),
            ),
            decoration: BoxDecoration(
                color: Colors.yellow[400],
                image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        // 颜色滤镜
                        Colors.yellow[400].withOpacity(0.6),
                        BlendMode.hardLight),
                    image: NetworkImage(
                        'http://h.hiphotos.baidu.com/image/h%3D300/sign=575b36d70d3b5bb5a1d726fe06d2d523/a6efce1b9d16fdfad03ef192ba8f8c5494ee7b7f.jpg'))),
          ),
          ListTile(
            title: Text(
              'Messages',
              textAlign: TextAlign.right,
            ),
            trailing: Icon(
              Icons.message,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text(
              'Favorite',
              textAlign: TextAlign.right,
            ),
            trailing: Icon(
              Icons.favorite,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text(
              'Settings',
              textAlign: TextAlign.right,
            ),
            trailing: Icon(
              Icons.settings,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context), // close drawer
          )
        ],
      ),
    );
  }
}
