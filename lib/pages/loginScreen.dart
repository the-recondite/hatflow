import 'package:flutter/material.dart';
import 'package:hatflow/components/GLogin.dart';
import 'package:hatflow/components/simpleButton.dart';
import 'package:hatflow/components/textControl.dart';
import 'package:hatflow/utils/colors.dart';
import 'package:hatflow/utils/helpers.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: getSize(context, 150),), 
          Hero(tag: "logo", child: Center(child: textControl("hatflow", context, size: 40, fontWeight: FontWeight.w700, color: colors.blueColor))),
          SizedBox(height: getSize(context, 60),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getSize(context, 40)),
            child: textControl("hatflow allows you to keep an accurate track of the physical stock you have, what’s been sold, and what hasn’t. ", context, size: 25, textAlign: TextAlign.center, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: getSize(context, 120),),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: getSize(context, 40)),
          //   child: GLogin,
          // )
          Padding(
              padding: EdgeInsets.symmetric(horizontal: getSize(context, 40)),
              child: GLogin()
          )
        ],
      ),
    );
  }
}
