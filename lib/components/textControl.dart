import 'package:flutter/material.dart';
import 'package:hatflow/utils/fonts.dart';
import 'package:hatflow/utils/helpers.dart';

Text textControl(String text, BuildContext context, {
  FontWeight fontWeight: FontWeight.w400, String font, double height: 1.5,
  Key key, double size: 22, Color color, bool underline: false, double spacing:0, TextAlign textAlign: TextAlign.start, bool overflow}
    ){
  if(color == null){
    color = Colors.black.withOpacity(0.7);
  }

  if(font == null){
    font = fonts.nunito;
  }
  return Text(text,
    textAlign: textAlign,
    overflow: overflow!=null?TextOverflow.ellipsis:null,
    style: TextStyle(
        fontSize: getSize(context, size),
        fontFamily: font,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: spacing,
        height: height,
        decoration: underline ? TextDecoration.underline : null
    ),
    key: key,
  );
}