import 'package:flutter/material.dart';
import 'package:hatflow/pageController.dart';
import 'package:hatflow/pages/addItem.dart';
import 'package:hatflow/pages/items.dart';
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
  static String items = "items";
  static String addItem = "add_item";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: splashScreen,
      routes: {
        splashScreen: (context) => SplashScreen(),
        loginScreen: (context) => LoginScreen(),
        pageController: (context) => PageControl(),
        items: (context) => Items(),
        addItem: (context) => AddItem()
      },
    );
  }
}
