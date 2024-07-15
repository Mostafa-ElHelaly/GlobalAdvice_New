import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:globaladvice_new/core/resource_manger/asset_path.dart';
import 'package:globaladvice_new/core/resource_manger/color_manager.dart';
import 'package:globaladvice_new/core/resource_manger/locale_keys.g.dart';
import 'package:globaladvice_new/core/utils/config_size.dart';
import 'package:globaladvice_new/core/widgets/custom_text_field.dart';
import 'package:globaladvice_new/features/home/presentation/component/medical_form/Widgets/done.dart';
import 'package:globaladvice_new/features/home/presentation/component/property_form/pages/property_form_2%20.dart';
import 'package:globaladvice_new/features/home/presentation/component/property_form/widgets/Prop_insurance_appbar.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../../core/widgets/main_button.dart';
import '../../../../../../main_screen.dart';

class PropertyFormMainPersonData extends StatefulWidget {
  const PropertyFormMainPersonData({super.key});

  @override
  State<PropertyFormMainPersonData> createState() =>
      _PropertyFormMainPersonDataState();
}

class _PropertyFormMainPersonDataState
    extends State<PropertyFormMainPersonData> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    fullNameController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  final List<String> items = [
    'Male',
    'Female',
  ];

  final List<String> carBrand = [
    'skoda',
    'kia',
    'Honda',
    'Bmw',
    'Volvo',
    'Seat',
    'Mini',
  ];
  final List<String> motorDeductibles = [
    '10%',
    '25%',
    'No Deductible',
  ];
  final List<String> manufactureYear = [
    '2015',
    '2016',
    '2017',
    '2018',
    '2019',
    '2020',
    '2021',
    '2022',
    '2023',
    '2024',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PropertyAppbar(context),
      body: Padding(
        padding: EdgeInsets.all(ConfigSize.defaultSize! * 1.5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              CustomTextField(
                labeltext: StringManager.fullName.tr(),
                prefixicon: const Icon(Icons.person),
                controller: fullNameController,
                inputType: TextInputType.name,
              ),
              SizedBox(
                height: ConfigSize.defaultSize! * 2,
              ),
              CustomTextField(
                labeltext: StringManager.phone.tr(),
                prefixicon: const Icon(Icons.phone_android_sharp),
                controller: phoneController,
                inputType: TextInputType.phone,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: ConfigSize.defaultSize! * 3),
                child: MainButton(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: const PropertyForm2(),
                      withNavBar: false,
                      pageTransitionAnimation: PageTransitionAnimation.fade,
                    );
                  },
                  title: StringManager.next.tr(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}