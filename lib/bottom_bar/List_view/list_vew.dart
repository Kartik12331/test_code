import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {

final height = MediaQuery.of(context).size.height;
final width = MediaQuery.of(context).size.width;
    return  ListView.builder(padding: EdgeInsets.zero,itemBuilder: (context,index){
      return
        Card( shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),color: index.isEven?Colors.blue:Colors.red,child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:Image.asset("assets/img_1.png",
                // width: double.infinity,
                // height: double.,
                fit: BoxFit.fill)


          // Assets.png.gradientBackground.image(
          //     width: double.infinity,
          //     height: double.infinity,
          //     fit: BoxFit.fill
          // ),
        ),);
    });
  }
}
