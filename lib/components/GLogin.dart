import 'package:flutter/material.dart';
import 'package:hatflow/components/simpleButton.dart';
import 'package:hatflow/main.dart';
import 'package:hatflow/utils/colors.dart';
import 'package:hatflow/utils/helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GLogin extends StatefulWidget {
  @override
  _GLoginState createState() => _GLoginState();
}

class _GLoginState extends State<GLogin> {
  bool loading = false;

  submit() async{
    try {
      await googleSignIn.signOut();
      final response = await googleSignIn.signIn();
      final authentication = await response.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: authentication.accessToken,
        idToken: authentication.idToken,
      );
      final UserCredential user = await auth.signInWithCredential(credential);
      setState(() {
        loading = true;
      });
      Navigator.pushReplacementNamed(context, MyApp.pageController);
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return simpleButton("Sign in with Google", context, padH: getWidth(context), backColor: colors.blueColor, borderColor: colors.blueColor, haveBorder: true, borderRadius: 20, onTap: submit);
  }
}