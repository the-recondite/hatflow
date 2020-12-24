import 'package:flutter/material.dart';
import 'package:hatflow/components/textControl.dart';
import 'package:hatflow/utils/helpers.dart';

void showCustomDialog(BuildContext context, Widget content, {Function cancelTap, Function continueTap, String title, String body, String continueButtonText = "Continue", String cancelButtonText = "Cancel"}) {
  Widget cancelButton = FlatButton(
    child: Text(cancelButtonText.toUpperCase(), style: TextStyle(fontSize: getSize(context, 15)),),
    onPressed: cancelTap,
  );
  Widget continueButton = FlatButton(
    child: Text(continueButtonText.toUpperCase(), style: TextStyle(fontSize: getSize(context, 15)),),
    onPressed: continueTap,
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: textControl(title, context, size: getSize(context, 17), fontWeight: FontWeight.bold),
    content: content,
    actions: [
      cancelTap!=null?cancelButton:SizedBox(),
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