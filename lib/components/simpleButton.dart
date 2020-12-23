import 'package:flutter/material.dart';
import 'package:hatflow/components/textControl.dart';
import 'package:hatflow/utils/colors.dart';
import 'package:hatflow/utils/helpers.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget simpleButton(
    String text,
    BuildContext context,
    {
      double padV: 50, double padH: 200,
      double fontSize: 13, double borderRadius: 10,
      Color backColor, Color color, FontWeight fontWeight,
      Function onTap,
      bool loading = false,
      bool disabled = false,
      Color loaderColor,
      Widget child,
      bool haveBorder: false,
      double borderWidth: 1,
      Color borderColor: Colors.black,
    }
    ){
  return GestureDetector(
    onTap: (){
      if(disabled)return;
      onTap();
    },
    child: Container(
      height: getSize(context, padV),
      width: padH == getWidth(context) ? padH : getSize(context, padH),
      child: Stack(
        children: [
          Center(
            child: loading ? SpinKitThreeBounce(
              size: getSize(context, 20),
              color: loaderColor == null ? Colors.white : loaderColor,
            ):
            child == null ? textControl(text, context, size: fontSize,
                color: color == null ? Colors.white : color,
                fontWeight: fontWeight == null ? FontWeight.w600 : fontWeight):child,
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: disabled ? Colors.grey :backColor == null ? colors.blueColor : backColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: haveBorder ? Border.all(width: borderWidth, color: borderColor) : null
      ),
    ),
  );
}