import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MessageDisplayWidget extends StatelessWidget {
  final String message;
  const MessageDisplayWidget({Key? key, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: SingleChildScrollView(child: 
        Text(message,style: TextStyle(fontSize: 25),
        textAlign: TextAlign.center,),
      ),)
    );
  }
}
