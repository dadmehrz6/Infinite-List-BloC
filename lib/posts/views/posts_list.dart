import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinte_list/posts/bloc/post_bloc.dart';
import 'package:infinte_list/posts/widgets/bottom_loader.dart';
import 'package:infinte_list/posts/widgets/post_item_list.dart';

class PostsList extends StatefulWidget {
  const PostsList({super.key});

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch (state.status) {
            case PostStatus.failure:
              return const Center(child: Text('failed to fetch data'));
            case PostStatus.initial:
              return const Center(child: CircularProgressIndicator());
            case PostStatus.success:
              return state.posts.isEmpty
                  ? const Center(child: Text('no data'))
                  : ListView.builder(
                      controller: _scrollController,
                      itemBuilder: (context, index) {
                        return index >= state.posts.length
                            ? const BottomLoader()
                            : PostItemList(post: state.posts[index]);
                      },
                      itemCount: state.hasReachedMax
                          ? state.posts.length
                          : state.posts.length + 1,
                    );
          }
        },
      ),
    );
  }

  void _onScroll() {
    if (_isBottom) context.read<PostBloc>().add(PostsFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScrollPosible = _scrollController.position.maxScrollExtent;
    final currentScrollPostition = _scrollController.offset;
    return currentScrollPostition >= maxScrollPosible * 0.9;
  }
}
