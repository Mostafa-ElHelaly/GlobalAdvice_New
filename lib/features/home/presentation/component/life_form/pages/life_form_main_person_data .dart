import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:globaladvice_new/core/resource_manger/asset_path.dart';
import 'package:globaladvice_new/core/resource_manger/color_manager.dart';
import 'package:globaladvice_new/core/resource_manger/locale_keys.g.dart';
import 'package:globaladvice_new/core/utils/config_size.dart';
import 'package:globaladvice_new/core/widgets/custom_text_field.dart';
import 'package:globaladvice_new/features/home/presentation/component/life_form/widgets/Back_Button.dart';
import 'package:globaladvice_new/features/home/presentation/component/medical_form/Widgets/done.dart';
import 'package:globaladvice_new/features/home/presentation/component/property_form/widgets/Property_Dropdown_Widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../../core/widgets/main_button.dart';
import '../../../home_screen.dart';
import '../widgets/Life_Insu_Appbar.dart';

class LifeFormMainPersonData extends StatefulWidget {
  const LifeFormMainPersonData({super.key});

  @override
  State<LifeFormMainPersonData> createState() => _LifeFormMainPersonDataState();
}

class _LifeFormMainPersonDataState extends State<LifeFormMainPersonData> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController termsController = TextEditingController();
  TextEditingController disabilitesController = TextEditingController();
  TextEditingController premiumamountController = TextEditingController();
  TextEditingController insuredamountController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  List<String> genders = ['Male', 'Female'];
  Future<Null> _selectDate(BuildContext context) async {
    DateTime currentdate = DateTime.now();
    final DateTime? picked = await showDatePicker(
        builder: (context, child) {
          return Theme(
              data: ThemeData.light().copyWith(
                hintColor: ColorManager.gray,
                colorScheme:
                    const ColorScheme.light(primary: ColorManager.mainColor),
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
  void initState() {
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    termsController = TextEditingController();
    disabilitesController = TextEditingController();
    premiumamountController = TextEditingController();
    insuredamountController = TextEditingController();
    occupationController = TextEditingController();
    birthdayController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    termsController.dispose();
    disabilitesController.dispose();
    premiumamountController.dispose();
    insuredamountController.dispose();
    occupationController.dispose();
    birthdayController.dispose();
    super.dispose();
  }

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: LifeAppbar(context),
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
                labeltext: StringManager.email.tr(),
                prefixicon: const Icon(Icons.email),
                controller: emailController,
                inputType: TextInputType.emailAddress,
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
                    icon: const Icon(Icons.calendar_today)),
              ),
              SizedBox(
                height: ConfigSize.defaultSize! * 2,
              ),
              PropertyDropdown(
                selectedValue: selectedValue,
                label: StringManager.gender.tr(),
                list: genders,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
              ),
              SizedBox(
                height: ConfigSize.defaultSize! * 2,
              ),
              CustomTextField(
                labeltext: StringManager.occupation.tr(),
                prefixicon: const Icon(Icons.work_outline),
                controller: occupationController,
                inputType: TextInputType.text,
              ),
              SizedBox(
                height: ConfigSize.defaultSize! * 2,
              ),
              CustomTextField(
                labeltext: StringManager.insuredAmount.tr(),
                prefixicon: const Icon(Icons.money),
                controller: insuredamountController,
                inputType: TextInputType.number,
              ),
              SizedBox(
                height: ConfigSize.defaultSize! * 2,
              ),
              CustomTextField(
                labeltext: StringManager.premiumAmount.tr(),
                prefixicon: const Icon(Icons.workspace_premium),
                controller: premiumamountController,
                inputType: TextInputType.number,
              ),
              SizedBox(
                height: ConfigSize.defaultSize! * 2,
              ),
              CustomTextField(
                labeltext: StringManager.disabilities.tr(),
                prefixicon: const Icon(Icons.elderly_woman_sharp),
                controller: disabilitesController,
                inputType: TextInputType.text,
              ),
              SizedBox(
                height: ConfigSize.defaultSize! * 2,
              ),
              CustomTextField(
                labeltext: StringManager.terms.tr(),
                prefixicon: const Icon(Icons.library_books),
                controller: termsController,
                inputType: TextInputType.text,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: ConfigSize.defaultSize! * 3),
                child: MainButton(
                  onTap: () {
                    AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            animType: AnimType.rightSlide,
                            desc: StringManager.lifeinsurancerequest.tr(),
                            btnOkOnPress: () {},
                            btnOk: const CustomBackButton())
                        .show();
                    Future.delayed(const Duration(seconds: 5), () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const HomeScreen(),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.fade,
                      );
                    });
                  },
                  title: StringManager.finish.tr(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
