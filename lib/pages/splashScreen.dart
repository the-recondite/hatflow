import 'package:flutter/material.dart';
import 'package:hatflow/components/textControl.dart';
import 'package:hatflow/main.dart';
import 'package:hatflow/utils/colors.dart';
import 'package:hatflow/utils/helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  AnimationController animation;
  Animation<double> _fadeInFadeOut;
  bool move = false;

  getUser() async{
    animation.dispose();
    var user = FirebaseAuth.instance.currentUser;
    bool signed = user!=null;
    signed?Navigator.pushReplacementNamed(context, MyApp.pageController):Navigator.pushReplacementNamed(context, MyApp.loginScreen);
  }

  @override
  void initState() {
    super.initState();
    animation = AnimationController(vsync: this, duration: Duration(seconds: 3),);
    _fadeInFadeOut = Tween<double>(begin: 0.3, end: 1.0).animate(animation);
    animation.addStatusListener((status){
     if(status == AnimationStatus.completed){
       getUser();
      }
    });
    animation.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: getWidth(context),
        height: getHeight(context),
        color: Colors.white,
        child: Center(
          child: FadeTransition(opacity: _fadeInFadeOut,child: Hero(tag:"logo", child: textControl("hatflow", context, size: 40, fontWeight: FontWeight.w700, color: colors.blueColor))),
        ),
      ),
    );
  }
}
