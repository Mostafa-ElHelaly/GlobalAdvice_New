import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:globaladvice_new/core/resource_manger/color_manager.dart';
import 'package:globaladvice_new/features/home/presentation/component/car_form/pages/Prices_Page.dart';
import 'package:globaladvice_new/features/home/presentation/component/car_form/widgets/car_insurance_appbar.dart';
import 'package:globaladvice_new/features/home/presentation/component/medical_form/Widgets/done.dart';
import 'package:globaladvice_new/features/home/presentation/component/medical_form/Widgets/medical_appbar.dart';
import 'package:globaladvice_new/features/home/presentation/component/property_form/widgets/Prop_insurance_appbar.dart';
import 'package:globaladvice_new/features/home/presentation/component/property_form/widgets/Property_Checkbox.dart';
import 'package:globaladvice_new/main_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../../core/resource_manger/asset_path.dart';
import '../../../../../../core/resource_manger/locale_keys.g.dart';
import '../../../../../../core/utils/config_size.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../core/widgets/main_button.dart';
import '../widgets/Property_Dropdown_Widget.dart';
import 'Prop_Prices_Page.dart';

class PropertyForm3 extends StatefulWidget {
  const PropertyForm3({super.key});

  @override
  State<PropertyForm3> createState() => _PropertyForm3State();
}

class _PropertyForm3State extends State<PropertyForm3> {
  String? selectedValue3;
  String? selectedValue4;
  String? selectedValue5;

  bool value1 = false;
  Random random = Random();

  List<String> Homedata = [
    'Burglary or attempted theft of contents',
    'Fire, lightning, and explosion',
    'Bursting of water tanks',
    'Damage of gas pipeline',
    'Strikes and riots',
    'Loss of rent',
    'Burglary or attempted theft of contents',
    'Fire, lightning, and explosion',
    'Bursting of water tanks',
    'Damage of gas pipeline',
    'Strikes and riots',
    'Loss of rent',
  ];
  List<bool> bools = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    final List<bool> booleanList = List.generate(Homedata.length, (_) => false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PropertyAppbar(context),
      body: Padding(
        padding: EdgeInsets.all(ConfigSize.defaultSize! * 1.5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ConfigSize.defaultSize! * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetsPath.logo,
                    scale: 5,
                  ),
                ],
              ),
              SizedBox(
                height: ConfigSize.defaultSize! * 2,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: ColorManager.gray)),
                          height: ConfigSize.defaultSize! * 50,
                          child: GridView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: Homedata.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing:
                                        ConfigSize.defaultSize! * 1,
                                    mainAxisSpacing:
                                        ConfigSize.defaultSize! * 1,
                                    childAspectRatio: 2,
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return PropertyCheckbox(
                                title: Homedata[index],
                                value: bools[index],
                                onChanged: (bool? value) {
                                  setState(() {
                                    bools[index] = value!;
                                  });
                                },
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: ConfigSize.defaultSize! * 2),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: ConfigSize.defaultSize! * 1),
                child: MainButton(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const DoneScreen();
                      },
                    );
                    Future.delayed(Duration(seconds: 3), () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: PropertyPrices(),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.fade,
                      );
                    });
                  },
                  title: StringManager.submit.tr(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
