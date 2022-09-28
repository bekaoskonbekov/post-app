import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool multiLiness;
  final String name;
  const TextFormFieldWidget({Key? key, required this.controller, required this.multiLiness, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        maxLines: multiLiness?6:1,
        minLines: multiLiness?6:1,
        controller: controller,
        validator: (val) => val!.isEmpty ? "$name cant be empty" : null,
        decoration: InputDecoration(hintText: name),
      ),
    );
  }
}
