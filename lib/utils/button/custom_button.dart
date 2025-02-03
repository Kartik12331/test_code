import 'package:flutter/material.dart';

import '../color.dart';

class NextButton extends StatelessWidget {

  void Function()? onPress;
   NextButton({super.key ,this.onPress});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return   InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 11),
        alignment:Alignment.center ,
        width: width,
        height: height / 22,
        decoration:
        BoxDecoration(color: AppColor.black,borderRadius: BorderRadius.circular(16)),
        child: Text("Next",style: TextStyle(color: AppColor.white,fontSize: 15),),
      ));
  }
}
