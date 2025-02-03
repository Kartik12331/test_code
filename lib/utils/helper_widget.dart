import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:machine_test/utils/color.dart';

Row tabIndex(int index) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      for(var i=0;i<4;i++)
        Container(height: 4,width: 31,margin: EdgeInsets.symmetric(horizontal: 1,),decoration: BoxDecoration(color:
        i<index?AppColor.black:AppColor.blackShade,borderRadius:BorderRadius.circular(11)),),

    ],
  );
}