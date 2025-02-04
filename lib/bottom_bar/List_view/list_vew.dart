import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index){
      return Card( shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),color: index.isEven?Colors.blue:Colors.red,child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(index.toString()),
      ),);
    });
  }
}
