import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:globaladvice_new/core/resource_manger/asset_path.dart';
import 'package:globaladvice_new/core/resource_manger/color_manager.dart';
import 'package:globaladvice_new/core/resource_manger/locale_keys.g.dart';
import 'package:globaladvice_new/core/utils/config_size.dart';
import 'package:globaladvice_new/features/home/presentation/component/car_form/pages/car_form_1.dart';
import 'package:globaladvice_new/features/home/presentation/component/life_form/pages/life_form_main_person_data%20.dart';
import 'package:globaladvice_new/features/home/presentation/component/property_form/pages/property_form_1%20.dart';
import 'package:globaladvice_new/features/profile/presentation/profile_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../medical_form/Pages/medical_form_1.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          AssetsPath.logo,
          scale: 10,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ConfigSize.defaultSize! * 2,
                    vertical: ConfigSize.defaultSize! * 4),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const MedicalFormMainPersonData(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.fade,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorManager.kPrimaryBlueDark,
                                borderRadius:
                                    BorderRadiusDirectional.circular(12)),
                            width: ConfigSize.defaultSize! * 18,
                            height: ConfigSize.defaultSize! * 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.medical_services_outlined,
                                  color: ColorManager.whiteColor,
                                  size: 50,
                                ),
                                SizedBox(
                                  height: ConfigSize.defaultSize! * 1,
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .medicalinsurance,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: ColorManager.whiteColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const CarFormMainPersonData(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.fade,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorManager.kPrimaryBlueDark,
                                borderRadius:
                                    BorderRadiusDirectional.circular(12)),
                            width: ConfigSize.defaultSize! * 18,
                            height: ConfigSize.defaultSize! * 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.car_crash_outlined,
                                  color: ColorManager.whiteColor,
                                  size: 50,
                                ),
                                SizedBox(
                                  height: ConfigSize.defaultSize! * 1,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.carisurance,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: ColorManager.whiteColor,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ConfigSize.defaultSize! * 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const PropertyFormMainPersonData(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.fade,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorManager.kPrimaryBlueDark,
                                borderRadius:
                                    BorderRadiusDirectional.circular(12)),
                            width: ConfigSize.defaultSize! * 18,
                            height: ConfigSize.defaultSize! * 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.house_outlined,
                                  color: ColorManager.whiteColor,
                                  size: 50,
                                ),
                                SizedBox(
                                  height: ConfigSize.defaultSize! * 1,
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .propertyinsurance,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: ColorManager.whiteColor,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const LifeFormMainPersonData(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.fade,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorManager.kPrimaryBlueDark,
                                borderRadius:
                                    BorderRadiusDirectional.circular(12)),
                            width: ConfigSize.defaultSize! * 18,
                            height: ConfigSize.defaultSize! * 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.monitor_heart_outlined,
                                  color: ColorManager.whiteColor,
                                  size: 50,
                                ),
                                SizedBox(
                                  height: ConfigSize.defaultSize! * 1,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.lifeinsurance,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: ColorManager.whiteColor,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ConfigSize.defaultSize! * 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const CardScreen(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.fade,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorManager.kPrimaryBlueDark,
                                borderRadius:
                                    BorderRadiusDirectional.circular(12)),
                            width: ConfigSize.defaultSize! * 18,
                            height: ConfigSize.defaultSize! * 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.person_2_outlined,
                                  color: ColorManager.whiteColor,
                                  size: 50,
                                ),
                                SizedBox(
                                  height: ConfigSize.defaultSize! * 1,
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .pensioninsurance,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: ColorManager.whiteColor,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const CardScreen(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.fade,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorManager.kPrimaryBlueDark,
                                borderRadius:
                                    BorderRadiusDirectional.circular(12)),
                            width: ConfigSize.defaultSize! * 18,
                            height: ConfigSize.defaultSize! * 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.directions_boat_filled_outlined,
                                  color: ColorManager.whiteColor,
                                  size: 50,
                                ),
                                SizedBox(
                                  height: ConfigSize.defaultSize! * 1,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.marineinsurance,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: ColorManager.whiteColor,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ConfigSize.defaultSize! * 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const CardScreen(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.fade,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorManager.kPrimaryBlueDark,
                                borderRadius:
                                    BorderRadiusDirectional.circular(12)),
                            width: ConfigSize.defaultSize! * 18,
                            height: ConfigSize.defaultSize! * 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.airplanemode_active_outlined,
                                  color: ColorManager.whiteColor,
                                  size: 50,
                                ),
                                SizedBox(
                                  height: ConfigSize.defaultSize! * 1,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.travelinsurance,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: ColorManager.whiteColor,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const CardScreen(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.fade,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorManager.kPrimaryBlueDark,
                                borderRadius:
                                    BorderRadiusDirectional.circular(12)),
                            width: ConfigSize.defaultSize! * 18,
                            height: ConfigSize.defaultSize! * 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.laptop_chromebook_outlined,
                                  color: ColorManager.whiteColor,
                                  size: 50,
                                ),
                                SizedBox(
                                  height: ConfigSize.defaultSize! * 1,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.cyberinsurance,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: ColorManager.whiteColor,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ConfigSize.defaultSize! * 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const CardScreen(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.fade,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorManager.kPrimaryBlueDark,
                                borderRadius:
                                    BorderRadiusDirectional.circular(12)),
                            width: ConfigSize.defaultSize! * 18,
                            height: ConfigSize.defaultSize! * 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.person_off_outlined,
                                  color: ColorManager.whiteColor,
                                  size: 50,
                                ),
                                SizedBox(
                                  height: ConfigSize.defaultSize! * 1,
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .burglaryinsurance,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: ColorManager.whiteColor,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const CardScreen(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.fade,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorManager.kPrimaryBlueDark,
                                borderRadius:
                                    BorderRadiusDirectional.circular(12)),
                            width: ConfigSize.defaultSize! * 18,
                            height: ConfigSize.defaultSize! * 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.health_and_safety_outlined,
                                  color: ColorManager.whiteColor,
                                  size: 50,
                                ),
                                SizedBox(
                                  height: ConfigSize.defaultSize! * 1,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.contractorsrisk,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: ColorManager.whiteColor,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ConfigSize.defaultSize! * 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const CardScreen(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.fade,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorManager.kPrimaryBlueDark,
                                borderRadius:
                                    BorderRadiusDirectional.circular(12)),
                            width: ConfigSize.defaultSize! * 18,
                            height: ConfigSize.defaultSize! * 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.minor_crash_outlined,
                                  color: ColorManager.whiteColor,
                                  size: 50,
                                ),
                                SizedBox(
                                  height: ConfigSize.defaultSize! * 1,
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .personalaccidents,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: ColorManager.whiteColor,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const CardScreen(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.fade,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorManager.kPrimaryBlueDark,
                                borderRadius:
                                    BorderRadiusDirectional.circular(12)),
                            width: ConfigSize.defaultSize! * 18,
                            height: ConfigSize.defaultSize! * 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.person_pin_outlined,
                                  color: ColorManager.whiteColor,
                                  size: 50,
                                ),
                                SizedBox(
                                  height: ConfigSize.defaultSize! * 1,
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .generalaccidents,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: ColorManager.whiteColor,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // help & howto
                    SizedBox(
                      height: ConfigSize.defaultSize! * 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const CardScreen(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.fade,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorManager.kPrimaryBlueDark,
                                borderRadius:
                                    BorderRadiusDirectional.circular(12)),
                            width: ConfigSize.defaultSize! * 18,
                            height: ConfigSize.defaultSize! * 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.how_to_vote_outlined,
                                  color: ColorManager.whiteColor,
                                  size: 50,
                                ),
                                SizedBox(
                                  height: ConfigSize.defaultSize! * 1,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.howto,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: ColorManager.whiteColor,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const CardScreen(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.fade,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorManager.kPrimaryBlueDark,
                                borderRadius:
                                    BorderRadiusDirectional.circular(12)),
                            width: ConfigSize.defaultSize! * 18,
                            height: ConfigSize.defaultSize! * 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.help_outline,
                                  color: ColorManager.whiteColor,
                                  size: 50,
                                ),
                                SizedBox(
                                  height: ConfigSize.defaultSize! * 1,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.help,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: ColorManager.whiteColor,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
