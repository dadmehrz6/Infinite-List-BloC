import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinte_list/posts/bloc/post_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:infinte_list/posts/views/posts_list.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => PostBloc(httpClient: http.Client())..add(PostsFetched()),
        child: const PostsList(),
      ),
    );
  }
}
