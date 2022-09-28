import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arcitecture_post_app/core/utils/snacbar_message.dart';
import 'package:flutter_clean_arcitecture_post_app/core/widgets/loading_widegt.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/presentation/pages/home_page.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/presentation/widgets/post_detail_page/delete_dialog_widget.dart';


import '../../bloc/add_delete_update/add_delete_update_post_bloc.dart';

class DeletePostWidgetBtn extends StatelessWidget {
  final int postId;
  const DeletePostWidgetBtn({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style:
            ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
        onPressed: () => deleteDialog(context, postId),
        icon: Icon(Icons.delete),
        label: Text("Delete"));
  }
   
  void deleteDialog(BuildContext context, int postId) {
    showDialog(
        context: context,
        builder: (context) {
          return BlocConsumer<AddDeleteUpdatePostBloc,
              AddDeleteUpdatePostState>(
            listener: (context, state) {
              if (state is MessageAddDeleteUpdatePostState) {
                SnackBarMessage().showSuccesSnackBar(
                    message: state.message, context: context);

                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (_) => HomePage(),
                    ),
                    (route) => false);
              } else if (state is ErrorAddDeleteUpdatePostState) {
                Navigator.of(context).pop();
                SnackBarMessage().showErrorSnackBar(
                    message: state.message, context: context);
              }
            },
            builder: (context, state) {
              if (state is LoadingAddDeleteUpdatePostState) {
                return AlertDialog(
                  title: LoadingWidegt(),
                );
              }
              return DeleteDialogWidget(postId: postId);
            },
          );
        });
  }
}
