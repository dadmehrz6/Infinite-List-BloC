import 'package:flutter/material.dart';
import 'package:infinte_list/posts/views/post_page.dart';

class App extends MaterialApp {
  const App({super.key})
      : super(
          home: const PostPage(),
          debugShowCheckedModeBanner: false,
        );
}
