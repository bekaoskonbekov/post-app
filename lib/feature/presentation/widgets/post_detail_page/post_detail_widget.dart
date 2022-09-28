import 'package:flutter/material.dart';

import 'package:flutter_clean_arcitecture_post_app/feature/domain/entities/post_entity.dart';

import 'package:flutter_clean_arcitecture_post_app/feature/presentation/pages/post_add_update_post.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/presentation/widgets/post_detail_page/delete_dialog_widget.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/presentation/widgets/post_detail_page/delete_post_widget_btn.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/presentation/widgets/post_detail_page/update-post_btn.dart';


class PostDetailWidget extends StatelessWidget {
  final PostEntity post;
  const PostDetailWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            post.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            height: 50,
          ),
          Text(
            post.body,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Divider(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UpdatePostBtn(post: post),
              DeletePostWidgetBtn(postId: post.id!)
            ],
          )
        ],
      ),
    );
  }


}
