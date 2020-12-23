import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
final FirebaseAuth auth = FirebaseAuth.instance;