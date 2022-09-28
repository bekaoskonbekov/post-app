import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/presentation/bloc/add_delete_update/add_delete_update_post_bloc.dart';

class DeleteDialogWidget extends StatelessWidget {
  final int postId;
  const DeleteDialogWidget({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      title: Text("Are you Sure ?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            "No",style: TextStyle(color: Colors.red),
          ),
        ),
        TextButton(
          onPressed: () {
            BlocProvider.of<AddDeleteUpdatePostBloc>(context).add(
              DeletePostEvent(postId: postId),
            );
          },
          child: Text("Yes",style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
