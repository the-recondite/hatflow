import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hatflow/utils/fonts.dart';
import 'package:hatflow/utils/helpers.dart';
import 'package:intl/intl.dart';

Widget
textInputField(BuildContext context, {double borderRadius: 7, dynamic value = "", double height: 50, Function onChange, String placeholder:"", double fontSize: 14, bool noBorder: false,
  FocusNode focusNode, String errorText, bool multiLine: false, String type = "text", bool autofocus = false, Color backColor: Colors.white, Color placeholderColor, double placeholderSize: 13, Color borderColor,
  bool disabled=false, Widget leftSide, double leftSize: 0, TextEditingController textEditingController, bool formatNumber = true, int maxLength, Key key}){
  List<TextInputFormatter> formatList = [];
  if (formatNumber) {
    if(type == "number"){
      formatList.add(NumericTextFormatter());
    }
  }
  if(borderColor == null)borderColor = Colors.black.withOpacity(0.3);
  return Container(
    width: getWidth(context),
    height: getSize(context, height),
    decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: noBorder ? null : Border.all(width: 1, color: borderColor)
    ),
    padding: EdgeInsets.symmetric(horizontal: getSize(context, 20)),
    child: Stack(
      children: [
        leftSide != null ? Positioned.fill(child: Align(
          alignment: Alignment.centerLeft,
          child: leftSide,
        )) : SizedBox(),
        TextFormField(
          key: key,
          controller: textEditingController,
          autofocus: autofocus,
          style: TextStyle(
            fontSize: getSize(context, fontSize),
            fontFamily: fonts.nunito,
            fontWeight: FontWeight.w500,
            color: disabled ? Colors.black.withOpacity(0.3):placeholderColor!=null?placeholderColor:Colors.black,
          ),
          onChanged: (e){
            if(type == "number"){
              onChange(e.replaceAll(",", ""));
            }
            else{
              onChange(e);
            }
          },
          focusNode: focusNode,
          initialValue: textEditingController == null ? type == "number" && formatNumber ? value == null || value == "" ? "" :
          numberFormat.format(double.parse(value.toString())).toString() : value == null ? "": value.toString() : null,
          enabled: !disabled,
          keyboardType: type == "multiline" ? TextInputType.multiline : type == "number" ? TextInputType.number : TextInputType.text,
          inputFormatters: formatList,
          textAlignVertical: TextAlignVertical.center,
          maxLines: type == "multiline" ? 3 : 1,
          maxLength: maxLength,
          decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              errorText: errorText,
              contentPadding: EdgeInsets.only(left: getSize(context, leftSize), top: getSize(context, 15), bottom: getSize(context, 15)),
              counterText: "",
              hintText: placeholder,
              hintStyle: TextStyle(
                  fontSize: getSize(context, placeholderSize),
                  fontFamily: fonts.nunito,
                  color: placeholderColor == null ? Colors.black.withOpacity(0.3) : placeholderColor
              )
          ),
        ),
      ],
    ),
  );
}

class NumericTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {

      final int selectionIndexFromTheRight =
          newValue.text.length - newValue.selection.end;


      NumberFormat f = NumberFormat("#,###");

      if(newValue.text.contains(".")){
        if(newValue.text.substring(newValue.text.length - 1) == "."){
          if(oldValue.text.length > newValue.text.length){
            f = NumberFormat("#,###");
          }
          else{
            f = NumberFormat("#,###.");
          }
        }
        else{
          f = NumberFormat("#,###.##");
        }
      }

      final number = double.parse(newValue.text.replaceAll(f.symbols.GROUP_SEP, ''));
      final newString = f.format(number);
      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
            offset: newString.length - selectionIndexFromTheRight),
      );
    } else {
      return newValue;
    }
  }
}