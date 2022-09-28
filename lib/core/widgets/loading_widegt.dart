import 'package:flutter/material.dart';

class LoadingWidegt extends StatelessWidget {
const LoadingWidegt({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Padding(padding: EdgeInsets.all(20),
    child: SizedBox(height: 30,width: 30,
    child: Center(child: CircularProgressIndicator(color: Colors.red,)),),
    
    );
  }
}