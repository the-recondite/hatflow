import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hatflow/pages/loginScreen.dart';
import 'package:hatflow/utils/colors.dart';
import 'package:hatflow/utils/fonts.dart';
import 'package:hatflow/utils/helpers.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class PageControl extends StatelessWidget {
  PersistentTabController persistentTabController = PersistentTabController(initialIndex: 0);
  //const PageControl({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: persistentTabController,
      screens: _buildScreens(),
      items: _navBarsItems(context),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style9, //
    );
  }

  List<Widget> _buildScreens() {
    return [
      LoginScreen(),
      LoginScreen(),
      LoginScreen(),
      LoginScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return [
      bottomNavBarItem(context, "Items", Icons.shopping_cart_sharp),
      bottomNavBarItem(context, "Analytics", Icons.bar_chart),
      bottomNavBarItem(context, "Financial Report", Icons.file_copy_sharp),
      bottomNavBarItem(context, "Log Out", Icons.logout)
    ];
  }

  PersistentBottomNavBarItem bottomNavBarItem(BuildContext context, String title, IconData iconData){
    return PersistentBottomNavBarItem(
        icon: Icon(iconData),
        title: (title),
        activeColor: colors.blueColor,
        inactiveColor: CupertinoColors.systemGrey,
        textStyle: TextStyle(fontFamily: fonts.nunito, fontWeight: FontWeight.w700, fontSize: getSize(context, 15)),
        iconSize: getSize(context, 20)
    );
  }
}
