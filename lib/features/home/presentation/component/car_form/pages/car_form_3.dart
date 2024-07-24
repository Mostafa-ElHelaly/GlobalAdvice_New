import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:globaladvice_new/features/home/presentation/component/car_form/pages/Prices_Page.dart';
import 'package:globaladvice_new/features/home/presentation/component/car_form/widgets/car_insurance_appbar.dart';
import 'package:globaladvice_new/features/home/presentation/component/medical_form/Widgets/done.dart';
import 'package:globaladvice_new/features/home/presentation/component/medical_form/Widgets/medical_appbar.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../../core/resource_manger/asset_path.dart';
import '../../../../../../core/resource_manger/locale_keys.g.dart';
import '../../../../../../core/resource_manger/routs_manager.dart';
import '../../../../../../core/utils/arabic_numbers.dart';
import '../../../../../../core/utils/config_size.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../core/widgets/main_button.dart';
import '../../life_form/widgets/Back_Button.dart';
import '../widgets/Motor_Dropdown_Widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CarForm3 extends StatefulWidget {
  const CarForm3({super.key});

  @override
  State<CarForm3> createState() => _CarForm3State();
}

class _CarForm3State extends State<CarForm3> {
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
  String? selectedValue3;
  String? selectedValue4;
  String? selectedValue5;
  @override
  Widget build(BuildContext context) {
    final List<String> carBrand = [
      AppLocalizations.of(context)!.skoda,
      AppLocalizations.of(context)!.kia,
      AppLocalizations.of(context)!.honda,
      AppLocalizations.of(context)!.bmw,
      AppLocalizations.of(context)!.volvo,
      AppLocalizations.of(context)!.seat,
      AppLocalizations.of(context)!.mini,
    ];
    final List<String> motorDeductibles = [
      '10%',
      '25%',
      AppLocalizations.of(context)!.nodeductable,
    ];
    var localetype = Localizations.localeOf(context).languageCode;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CarAppbar(context),
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
                        CarDropdown(
                          list: carBrand,
                          onChanged: (String? value) {
                            setState(() {
                              selectedValue3 = value;
                            });
                          },
                          label: AppLocalizations.of(context)!.carbrand,
                          selectedValue: selectedValue3,
                        ),
                        SizedBox(height: ConfigSize.defaultSize! * 2),
                        CarDropdown(
                          list: motorDeductibles,
                          onChanged: (String? value) {
                            setState(() {
                              selectedValue4 = value;
                            });
                          },
                          label: AppLocalizations.of(context)!.motorDeductibles,
                          selectedValue: selectedValue4,
                        ),
                        SizedBox(height: ConfigSize.defaultSize! * 2),
                        CarDropdown(
                          list: manufactureYear,
                          onChanged: (String? value) {
                            setState(() {
                              selectedValue5 = value;
                            });
                          },
                          label: AppLocalizations.of(context)!.manufactureYear,
                          selectedValue: selectedValue5,
                        ),
                        SizedBox(height: ConfigSize.defaultSize! * 2),
                        SizedBox(height: ConfigSize.defaultSize! * 2),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: ConfigSize.defaultSize! * 1),
                child: MainButton(
                  onTap: () {
                    AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            animType: AnimType.rightSlide,
                            desc: AppLocalizations.of(context)!
                                .lifeinsurancerequest,
                            btnOkOnPress: () {},
                            btnOk: const CustomBackButton())
                        .show();
                    Future.delayed(Duration(seconds: 3), () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, Routes.homeScreen, (route) => false);
                    });
                  },
                  title: AppLocalizations.of(context)!.submit,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
