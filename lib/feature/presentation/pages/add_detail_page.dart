import 'package:flutter/material.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/domain/entities/post_entity.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/presentation/widgets/post_detail_page/post_detail_widget.dart';

class AddDetailPage extends StatelessWidget {
  final PostEntity post;
  const AddDetailPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      title: Text("Post Detail"),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: PostDetailWidget(
          post: post,
        ),
      ),
    );
  }
}
