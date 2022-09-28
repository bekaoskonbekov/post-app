import 'package:flutter/material.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/domain/entities/post_entity.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/presentation/pages/post_add_update_post.dart';

class UpdatePostBtn extends StatelessWidget {
  final PostEntity post;
const UpdatePostBtn({ Key? key, required this.post }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return  ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PostAddUpdatePost(
                isUpdatePost: true,
                post: post,
              ),
            ));
      },
      icon: Icon(Icons.edit),
      label: Text("Edit"),
    );
  }
}