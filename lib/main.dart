import 'package:flutter/material.dart';
import 'package:hatflow/pageController.dart';
import 'package:hatflow/pages/loginScreen.dart';
import 'package:hatflow/pages/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static String splashScreen = 'splash_screen';
  static String loginScreen = "login_screen";
  static String pageController = "page_controller";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: splashScreen,
      routes: {
        splashScreen: (context) => SplashScreen(),
        loginScreen: (context) => LoginScreen(),
        pageController: (context) => PageControl()
      },
    );
  }
}
