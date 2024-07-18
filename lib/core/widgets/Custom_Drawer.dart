import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:globaladvice_new/core/resource_manger/color_manager.dart';
import 'package:globaladvice_new/core/resource_manger/locale_keys.g.dart';
import 'package:globaladvice_new/core/resource_manger/routs_manager.dart';
import 'package:globaladvice_new/core/utils/config_size.dart';
import 'package:share/share.dart';

import '../resource_manger/asset_path.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: ConfigSize.defaultSize! * 5),
          Padding(
            padding: EdgeInsets.all(ConfigSize.defaultSize! * 2),
            child: Center(
              child: Container(
                height: ConfigSize.defaultSize! * 8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AssetsPath.logo),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: ConfigSize.defaultSize! * 2),
          DrawerTile(
            title: StringManager.home,
            icon: Icons.home,
            onTap: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(Routes.mainScreen, (route) => false);
            },
          ),
          MyDivider(),
          DrawerTile(
            title: StringManager.plans,
            icon: Icons.home_repair_service_rounded,
            onTap: () {
              Navigator.of(context).pushNamed(Routes.plans);
            },
          ),
          MyDivider(),
          DrawerTile(
            title: StringManager.myProfile,
            icon: Icons.person,
            onTap: () {
              Navigator.of(context).pushNamed(Routes.profile);
            },
          ),
          MyDivider(),
          DrawerTile(
            title: StringManager.editprofile,
            icon: Icons.edit,
            onTap: () {
              Navigator.of(context).pushNamed(Routes.editProfile);
            },
          ),
          MyDivider(),
          DrawerTile(
            title: StringManager.share,
            icon: Icons.share,
            onTap: () {
              Share.share(
                  'Check out this awesome app! https://globaladvice.org/');
            },
          ),
          MyDivider(),
          DrawerTile(
            title: StringManager.logOut,
            icon: Icons.exit_to_app,
            onTap: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(Routes.login, (route) => false);
            },
          ),
        ],
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  DrawerTile({super.key, required this.title, required this.icon, this.onTap});
  final String title;
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: ConfigSize.defaultSize! * 0.5,
          bottom: ConfigSize.defaultSize! * 0.5),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          size: ConfigSize.defaultSize! * 3,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontSize: ConfigSize.defaultSize! * 2,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: ColorManager.mainColor,
      height: ConfigSize.defaultSize! * 0.5,
      thickness: ConfigSize.defaultSize! * 0.125,
      endIndent: ConfigSize.defaultSize! * 3,
      indent: ConfigSize.defaultSize! * 3,
    );
  }
}
