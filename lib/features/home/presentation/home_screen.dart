import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:globaladvice_new/core/resource_manger/asset_path.dart';
import 'package:globaladvice_new/core/resource_manger/color_manager.dart';
import 'package:globaladvice_new/core/resource_manger/locale_keys.g.dart';
import 'package:globaladvice_new/core/utils/config_size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // current height of the expandable body
  double _currentHeight = 0;

// expanded height of the expandable body
  final double _expandedHeight = 250;

// height on change when clicked on the header
  void _expandOnChanged() {
    var isExpanded = _currentHeight == _expandedHeight;
    setState(() {
      _currentHeight = isExpanded ? 0 : _expandedHeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AssetsPath.logo,
          scale: 10,
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration:
                  const BoxDecoration(color: ColorManager.kPrimaryBlueDark),
              accountName: Text(
                "Global Advice",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ConfigSize.defaultSize! * 2),
              ),
              accountEmail: const Text("Global Advice@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: ConfigSize.defaultSize! * 5,
                  color: ColorManager.kPrimaryBlueDark,
                ),
              ),
              otherAccountsPictures: const <Widget>[],
            ),
            ListTile(
              title: const Text("Medical Insurance"),
              trailing: const Icon(Icons.medical_services_outlined),
              onTap: () => {},
            ),
            const Divider(),
            ListTile(
              title: const Text("Car insurance"),
              trailing: const Icon(Icons.car_crash_outlined),
              onTap: () => {},
            ),
            const Divider(),
            ListTile(
              title: const Text("Property Insurance"),
              trailing: const Icon(Icons.house_outlined),
              onTap: () => {},
            ),
            const Divider(),
            ListTile(
              title: const Text("life insurance"),
              trailing: const Icon(Icons.monitor_heart_outlined),
              onTap: () => Navigator.of(context).pop(),
            ),
            const Divider(),
            ListTile(
              title: const Text("Home"),
              trailing: const Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text("Home Screen"),
      ),
    );
  }
}
