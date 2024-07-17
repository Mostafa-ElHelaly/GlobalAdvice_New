import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:globaladvice_new/features/home/presentation/component/car_form/pages/car_form_3.dart';
import 'package:globaladvice_new/features/home/presentation/component/car_form/widgets/Motor_Dropdown_Widget.dart';
import 'package:globaladvice_new/features/home/presentation/component/car_form/widgets/car_insurance_appbar.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../../core/resource_manger/asset_path.dart';
import '../../../../../../core/resource_manger/color_manager.dart';
import '../../../../../../core/resource_manger/locale_keys.g.dart';
import '../../../../../../core/utils/config_size.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../core/widgets/main_button.dart';

class CarForm2 extends StatefulWidget {
  const CarForm2({super.key});

  @override
  State<CarForm2> createState() => _CarForm2State();
}

class _CarForm2State extends State<CarForm2> {
  TextEditingController emailController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();

  String? selectedValue1;
  String? selectedValue2;
  @override
  void initState() {
    emailController = TextEditingController();
    birthdayController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    birthdayController.dispose();
    super.dispose();
  }

  final List<String> genders = [
    'Male',
    'Female',
  ];
  final List<String> licensed = [
    'Licensed',
    'Unlicensed',
  ];
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    DateTime currentdate = DateTime.now();
    final DateTime? picked = await showDatePicker(
        builder: (context, child) {
          return Theme(
              data: ThemeData.light().copyWith(
                hintColor: ColorManager.gray,
                colorScheme: ColorScheme.light(primary: ColorManager.mainColor),
              ),
              child: child!);
        },
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1940, 1),
        lastDate:
            DateTime.utc(currentdate.year, currentdate.month, currentdate.day));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        String convertedDateTime =
            "${picked.year.toString()}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
        birthdayController.value = TextEditingValue(text: convertedDateTime);
        ;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CarAppbar(context),
      body: Padding(
        padding: EdgeInsets.all(ConfigSize.defaultSize! * 1.5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              CustomTextField(
                labeltext: StringManager.email.tr(),
                prefixicon: const Icon(Icons.email_rounded),
                controller: emailController,
                inputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: ConfigSize.defaultSize! * 2,
              ),
              CustomTextField(
                labeltext: StringManager.birthday.tr(),
                prefixicon: const Icon(Icons.cake),
                controller: birthdayController,
                inputType: TextInputType.none,
                suffix: IconButton(
                    onPressed: () async {
                      await _selectDate(context);
                    },
                    icon: Icon(Icons.calendar_today)),
              ),
              SizedBox(
                height: ConfigSize.defaultSize! * 2,
              ),
              CarDropdown(
                selectedValue: selectedValue1,
                label: StringManager.gender.tr(),
                list: genders,
                onChanged: (String? value) {
                  setState(() {
                    selectedValue1 = value;
                  });
                },
              ),
              SizedBox(
                height: ConfigSize.defaultSize! * 2,
              ),
              CarDropdown(
                selectedValue: selectedValue2,
                label: StringManager.licensed.tr(),
                list: licensed,
                onChanged: (String? value) {
                  setState(() {
                    selectedValue2 = value;
                  });
                },
              ),
              SizedBox(
                height: ConfigSize.defaultSize! * 2,
              ),
              CustomTextField(
                labeltext: StringManager.marketValue.tr(),
                prefixicon: const Icon(Icons.price_change),
                controller: emailController,
                inputType: TextInputType.number,
              ),
              SizedBox(
                height: ConfigSize.defaultSize! * 2,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: ConfigSize.defaultSize! * 2),
                child: MainButton(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: CarForm3(),
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
