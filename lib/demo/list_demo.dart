import 'package:flutter/material.dart';
import '../model/post.dart';

class ListViewDome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: _listItemBuilder,
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.only(bottom:8.0),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                AspectRatio(
                    aspectRatio: 16.0 / 9.0,
                    child: Image.network(posts[index].imageUrl,fit: BoxFit.cover,)),
                SizedBox(height: 16.0),
                Text(
                  posts[index].title,
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 16.0,
                )
              ],
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white.withOpacity(0.3),
                  highlightColor: Colors.white.withOpacity(0.5),
                  onTap: () {
                    debugPrint('Tap');
                  },
                ),
              ),
            )
          ],
        ));
  }
}
