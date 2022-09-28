import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arcitecture_post_app/core/utils/snacbar_message.dart';
import 'package:flutter_clean_arcitecture_post_app/core/widgets/loading_widegt.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/domain/entities/post_entity.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/presentation/bloc/add_delete_update/add_delete_update_post_bloc.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/presentation/pages/home_page.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/presentation/widgets/add_update_page/form_widget.dart';

class PostAddUpdatePost extends StatelessWidget {
  final PostEntity? post;
  final bool isUpdatePost;
  const PostAddUpdatePost({Key? key, this.post, required this.isUpdatePost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isUpdatePost ? "edit Post " : "Add Post"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: BlocConsumer<AddDeleteUpdatePostBloc, AddDeleteUpdatePostState>(
          listener: (context, state) {
            if (state is MessageAddDeleteUpdatePostState) {
              SnackBarMessage()
                  .showSuccesSnackBar(message: state.message, context: context);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => HomePage()),
                  (route) => false);
            }
          },
          builder: (context, state) {
            if (state is LoadingAddDeleteUpdatePostState) {
              return LoadingWidegt();
            } else if (state is ErrorAddDeleteUpdatePostState) {
               SnackBarMessage()
                  .showErrorSnackBar(message: state.message, context: context);
            }

           
            return FormWidget(
                isUpdatePost: isUpdatePost, post: isUpdatePost ? post : null);
          },
        ),
      ),
    );
  }
}
