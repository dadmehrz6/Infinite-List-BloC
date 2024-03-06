import 'package:flutter/material.dart';
import 'package:infinte_list/posts/models/post_model.dart';

class PostItemList extends StatelessWidget {
  const PostItemList({super.key, required this.post});
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          tileColor: Colors.amberAccent,
          leading: Text(
            '${post.id}',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          title: Text(
            post.title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(post.body),
          dense: true,
          isThreeLine: true,
        ),
      ),
    );
  }
}
