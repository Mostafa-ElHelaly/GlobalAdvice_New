import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:globaladvice_new/core/resource_manger/color_manager.dart';
import 'package:globaladvice_new/features/home/presentation/component/medical_form/Widgets/Gender_Drop_Down_Widget.dart';
import 'package:globaladvice_new/features/home/presentation/component/medical_form/Widgets/medical_appbar.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../../core/resource_manger/asset_path.dart';
import '../../../../../../core/resource_manger/locale_keys.g.dart';
import '../../../../../../core/utils/config_size.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../core/widgets/main_button.dart';
import '../../../../../../main_screen.dart';
import 'package:table_calendar/table_calendar.dart';

import 'medical_form_3.dart';

class MedicalForm2 extends StatefulWidget {
  const MedicalForm2({super.key});

  @override
  State<MedicalForm2> createState() => _MedicalForm2State();
}

class _MedicalForm2State extends State<MedicalForm2> {
  TextEditingController emailController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();

  String? selectedValue;
  DateTime selectedDate = DateTime.now();
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
      appBar: MedicalAppBar(context),
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
                      icon: Icon(Icons.calendar_today))),
              SizedBox(
                height: ConfigSize.defaultSize! * 2,
              ),
              Center(
                  child: DropDown(
                onchanged: (String? value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                selectedValue: selectedValue,
              )),
              SizedBox(height: ConfigSize.defaultSize! * 2),
              MainButton(
                onTap: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: const MainScreen(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.fade,
                  );
                },
                title: StringManager.addYourFamily.tr(),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: ConfigSize.defaultSize! * 2),
                child: MainButton(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: MedicalForm3(),
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
