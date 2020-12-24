import 'package:flutter/material.dart';
import 'package:hatflow/utils/colors.dart';
import 'package:hatflow/utils/helpers.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loaderMain(BuildContext context, {bool status=false, Color color}){
  if(!status){
    return SizedBox();
  }
  return Container(
    height: getHeight(context),
    width: getWidth(context),
    color: color == null ?Colors.black.withOpacity(0.3):color,
    child: Center(
      child: SpinKitRing(color: Colors.white, size: getSize(context, 50), lineWidth: 4,),
    ),
  );
}

Widget loaderMainTwo(BuildContext context, {bool status=false}){
  if(!status){
    return SizedBox();
  }
  return Container(
    height: getHeight(context),
    width: getWidth(context),
    child: Center(
      child: SpinKitRing(color: colors.blueColor, size: getSize(context, 30), lineWidth: 4,),
    ),
  );
}

