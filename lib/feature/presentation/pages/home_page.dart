import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arcitecture_post_app/core/widgets/loading_widegt.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/presentation/bloc/post/post_bloc.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/presentation/pages/post_add_update_post.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/presentation/widgets/message_display_widget.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/presentation/widgets/post_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: _buildBody(),
      floatingActionButton: _buildFloatingBtn(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is LoadingPostState) {
            return LoadingWidegt();
          } else if (state is LoadedPostState) {
            return PostListWidget(posts: state.posts);
          } else if (state is ErrorPostState) {
            return MessageDisplayWidget(message: state.message);
          }
          return LoadingWidegt();
        },
      ),
    );
  }

  Widget _buildFloatingBtn() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => PostAddUpdatePost(isUpdatePost: false)));
      },
      child: Icon(
        Icons.add,
        color: Colors.red,
      ),
    );
  }
}
