import 'package:flutter/material.dart';

class FormSubmitBtnWidget extends StatelessWidget {
  final void Function() onPressed;
  final bool isUpdatePost;
  const FormSubmitBtnWidget(
      {Key? key, required this.onPressed, required this.isUpdatePost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: onPressed,
        icon: isUpdatePost ? Icon(Icons.edit) : Icon(Icons.add),
        label: Text(isUpdatePost ? "Update" : "Add"));
  }
}
