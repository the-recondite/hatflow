import 'package:flutter/material.dart';
import 'package:hatflow/components/inputFields.dart';
import 'package:hatflow/components/insertContent.dart';
import 'package:hatflow/utils/colors.dart';
import 'package:hatflow/utils/helpers.dart';

Widget contentSearch(BuildContext context, {String value = "", Function onChange, Function onPressed, String placeholderText, TextEditingController textEditingController, bool filter = true, FocusNode focusNode}){
  return Flex(
    direction: Axis.horizontal,
    children: [
      Flexible(
        flex: 1,
        child: textInputField(context, value: value, textEditingController: textEditingController, onChange: onChange , backColor: colors.greyColor, placeholder: placeholderText!=null ? placeholderText:"Search", leftSide: Icon(Icons.search, color: Colors.black), leftSize: 30, borderRadius: 10, focusNode: focusNode),
      ),
      filter?Row(
        children: [
          SizedBox(width: getSize(context, 10),),
          insertContent(context, child: Icon(Icons.tune_sharp, color: Colors.white,), height: 50, width: 50, onTap: onPressed),
        ],
      ):SizedBox()
    ],
  );
}