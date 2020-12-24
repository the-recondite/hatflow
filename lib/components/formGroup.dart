import 'package:flutter/material.dart';
import 'package:hatflow/components/textControl.dart';
import 'package:hatflow/utils/helpers.dart';

Widget formGroup(BuildContext context, Widget child, {dynamic label="", double marginBottom: 20, bool labelText = true, double labelSize = 15}){
  return Container(
    margin: EdgeInsets.only(bottom: getSize(context, marginBottom)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        label == "" ? SizedBox() :
        labelText ? textControl(label, context, size: labelSize, color: Colors.black.withOpacity(0.5)) : label,
        SizedBox(height: label == "" ? 0 : getSize(context, 10),),
        child
      ],
    ),
  );
}