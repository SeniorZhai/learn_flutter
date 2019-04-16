import 'package:flutter/material.dart';
import '../model/post.dart';

class ViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridViewDemo();
  }
}

class GridViewDemo extends StatelessWidget {
  List<Widget> _builderTiles(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text('item $index',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey,
            )),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
        maxCrossAxisExtent: 120.0,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        children: _builderTiles(100));
  }
}

class PageViewBuilderDemo extends StatelessWidget {
  Widget _pagetItemBuilder(BuildContext context, int index) {
    return Stack(children: <Widget>[
      SizedBox.expand(
          child: Image.network(
        posts[index].imageUrl,
        fit: BoxFit.cover,
      )),
      Positioned(
        bottom: 8.0,
        left: 8.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              posts[index].title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(posts[index].author)
          ],
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _pagetItemBuilder,
    );
  }
}

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      // pageSnapping: false, // 页停留效果
      reverse: true, // 倒序
      onPageChanged: (index) => debugPrint('$index'), // 回调
      controller: PageController(
          initialPage: 1, // 初始位置
          keepPage: false, // 不记住位置
          viewportFraction: 0.80 // 页占显示区域的比例
          ),
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Container(
          color: Colors.brown[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            "one",
            style: TextStyle(color: Colors.white, fontSize: 32.0),
          ),
        ),
        Container(
          color: Colors.brown[700],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            "two",
            style: TextStyle(color: Colors.white, fontSize: 32.0),
          ),
        ),
        Container(
          color: Colors.brown[400],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            "three",
            style: TextStyle(color: Colors.white, fontSize: 32.0),
          ),
        )
      ],
    );
  }
}
