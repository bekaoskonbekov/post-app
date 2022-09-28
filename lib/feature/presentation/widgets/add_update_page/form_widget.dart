import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/domain/entities/post_entity.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/presentation/bloc/add_delete_update/add_delete_update_post_bloc.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/presentation/widgets/add_update_page/form_submit_btn_widget.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/presentation/widgets/add_update_page/text_form_field_widget.dart';
import 'package:http/http.dart';

class FormWidget extends StatefulWidget {
  final PostEntity? post;
  final bool isUpdatePost;
  const FormWidget({Key? key, this.post, required this.isUpdatePost})
      : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();
  @override
  void initState() {
    if (widget.isUpdatePost) {
      _titleController.text = widget.post!.title;
      _bodyController.text = widget.post!.body;
    }
    super.initState();
  }

  void validateFormThenUpdateOrAddPost() {
    final isVAlid = _formKey.currentState!.validate();
    final post = PostEntity(
        id: widget.isUpdatePost ? widget.post!.id : 0,
        title: _titleController.text,
        body: _bodyController.text);
    if (isVAlid) {
      if (widget.isUpdatePost) {
        ;
        BlocProvider.of<AddDeleteUpdatePostBloc>(context)
            .add(UpdatePostEvent(post: post));
      } else {
        BlocProvider.of<AddDeleteUpdatePostBloc>(context)
            .add(AddPostEvent(post: post));
      }
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         TextFormFieldWidget(controller: _titleController, multiLiness: false, name: "Title"),
         TextFormFieldWidget(controller: _bodyController, multiLiness: false, name: "Body"),

         FormSubmitBtnWidget(isUpdatePost:widget.isUpdatePost,onPressed:validateFormThenUpdateOrAddPost),
         
         
        ],
      ),
    );
  }
}
