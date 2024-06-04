import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:globaladvice_new/core/resource_manger/asset_path.dart';
import 'package:globaladvice_new/core/resource_manger/color_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  List<Widget> _buildScreens() {
    return [
      // const ServiceType(),
      // const HomeScreen(),
      // const AllChatsScreen(),
      // const NotificationScreen(),
      // const ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset(
          AssetsPath.app1,
          color: ColorManager.kPrimaryBlueDark,
          scale: 1.6,
        ),
        inactiveIcon: Image.asset(
          AssetsPath.app1,
          scale: 1.6,
        ),
        activeColorPrimary: ColorManager.kPrimaryBlueDark,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          AssetsPath.app1,
          color: ColorManager.kPrimaryBlueDark,
          scale: 1.6,
        ),
        inactiveIcon: Image.asset(
          AssetsPath.app1,
          scale: 1.6,
        ),
        activeColorPrimary: ColorManager.kPrimaryBlueDark,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          AssetsPath.app1,
          color: ColorManager.kPrimaryBlueDark,
          scale: 1.6,
        ),
        inactiveIcon: Image.asset(
          AssetsPath.app1,
          scale: 1.6,
        ),
        activeColorPrimary: ColorManager.kPrimaryBlueDark,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          AssetsPath.app1,
          color: ColorManager.kPrimaryBlueDark,
          scale: 1.6,
        ),
        inactiveIcon: Image.asset(
          AssetsPath.app1,
          scale: 1.6,
        ),
        activeColorPrimary: ColorManager.kPrimaryBlueDark,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          AssetsPath.app1,
          color: ColorManager.kPrimaryBlueDark,
          scale: 1.6,
        ),
        inactiveIcon: Image.asset(
          AssetsPath.app1,
          scale: 1.6,
        ),
        activeColorPrimary: ColorManager.kPrimaryBlueDark,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
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
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style12,
    );
  }
}
