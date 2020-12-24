import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hatflow/components/textControl.dart';
import 'package:hatflow/utils/fonts.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

double getHeight(BuildContext context){
  return MediaQuery.of(context).size.height;
}

double getWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}

double getSize(BuildContext context, double maxSize){
  double deleteVariable = 600;
  if(getHeight(context) > 900 && getHeight(context) <= 1200){
    deleteVariable = 700;
  }
  else if(getHeight(context) <= 900){
    deleteVariable = 800;
  }
  double newSize = getHeight(context) * maxSize / deleteVariable;
  if(newSize > maxSize){
    newSize = maxSize;
  }
  return newSize;
}

GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: [
    'email', 'profile'
  ],
);

void closeKeyboard(){
  Future.delayed(Duration.zero, () {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  });
}

void toastSuccess(String message){
  Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT, backgroundColor: Colors.black.withOpacity(0.3), textColor: Colors.white);
}

void showOptionDialog(BuildContext context, {Function cancelTap, Function continueTap, String title, String body, String continueButtonText = "Continue", String cancelButtonText = "Cancel"}) {
  Widget cancelButton = FlatButton(
    child: Text(cancelButtonText.toUpperCase(), style: TextStyle(fontSize: getSize(context, 15), fontFamily: fonts.nunito)),
    onPressed: cancelTap,
  );
  Widget continueButton = FlatButton(
    child: Text(continueButtonText.toUpperCase(), style: TextStyle(fontSize: getSize(context, 15), fontFamily: fonts.nunito),),
    onPressed: continueTap,
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: textControl(title, context, size: getSize(context, 17), fontWeight: FontWeight.bold),
    content: textControl(body, context, size: getSize(context, 17)),
    actions: [
      cancelTap == null ? SizedBox():cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

final FirebaseAuth auth = FirebaseAuth.instance;
NumberFormat numberFormat = new NumberFormat.decimalPattern();