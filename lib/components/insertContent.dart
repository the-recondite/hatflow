import 'package:flutter/material.dart';
import 'package:hatflow/utils/colors.dart';
import 'package:hatflow/utils/helpers.dart';

Widget insertContent(BuildContext context, {double height: 40,double width: 40, Color color, Widget child, Function onTap, double borderRadius: 6, double borderWidth: 0, Color borderColor: Colors.transparent}){
  if(color == null){
    color = colors.blueColor;
  }

  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: getSize(context, height),
      width: width == getWidth(context) ? width : getSize(context, width),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(getSize(context, borderRadius)),
          border: Border.all(width: borderWidth, color: borderColor)
      ),
      child: Center(
          child: child
      ),
    ),
  );
}