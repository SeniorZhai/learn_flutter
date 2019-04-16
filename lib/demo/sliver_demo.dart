import 'package:flutter/material.dart';
import '../model/post.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          // title: Text("Sliver Title"),
          // pinned: true, // 固定在顶部
          floating: true,
          expandedHeight: 178.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              "Hello flutter".toUpperCase(),
              style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.w400),
            ),
            background: Image.network(
              'https://abiko.loli.net/files/2019/04/16/aa942ab2bfa6ebda4840e7360ce6e7ef.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverSafeArea(
          // 显示在安全的可视范围 f
          sliver: SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: SliverGridDemo(),
          ),
        )
      ],
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 32.0),
          child: Material(
            borderRadius: BorderRadius.circular(12.0),
            elevation: 14.0,
            shadowColor: Colors.grey.withOpacity(0.5),
            child: Stack(
              children: <Widget>[
                AspectRatio(
                    aspectRatio: 16.0 / 9.0,
                    child: Image.network(
                      posts[index].imageUrl,
                      fit: BoxFit.cover,
                    )),
                Positioned(
                  top: 16.0,
                  left: 16.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        posts[index].title,
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        posts[index].title,
                        style: TextStyle(fontSize: 12.0, color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }, childCount: posts.length),
    );
  }
}
