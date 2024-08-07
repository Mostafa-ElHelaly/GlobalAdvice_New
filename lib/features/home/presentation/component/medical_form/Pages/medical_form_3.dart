import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:globaladvice_new/features/home/presentation/component/medical_form/Widgets/done.dart';
import 'package:globaladvice_new/features/home/presentation/component/medical_form/Widgets/medical_appbar.dart';
import 'package:globaladvice_new/features/home/presentation/manager/healthinsurancebloc/healthinsurancebloc_bloc.dart';
import 'package:globaladvice_new/features/home/presentation/manager/healthinsurancebloc/healthinsurancebloc_state.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:globaladvice_new/core/resource_manger/asset_path.dart';
import 'package:globaladvice_new/core/resource_manger/routs_manager.dart';
import 'package:globaladvice_new/core/utils/config_size.dart';
import 'package:globaladvice_new/core/widgets/main_button.dart';
import 'package:globaladvice_new/features/home/presentation/home_screen.dart';
import 'package:globaladvice_new/features/home/presentation/component/life_form/widgets/Back_Button.dart';

class MedicalForm3 extends StatefulWidget {
  const MedicalForm3({
    super.key,
  });

  @override
  State<MedicalForm3> createState() => _MedicalForm3State();
}

class _MedicalForm3State extends State<MedicalForm3> {
  final List<String> annual = [
    '250,000 EGP',
    '350,000 EGP',
    '450,000 EGP',
    '550,000 EGP',
  ];
  String? selectedValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HealthinsuranceBloc, HealthinsuranceblocState>(
        listener: (context, state) {
          if (state is HealthInsuranceSuccessState) {
            EasyLoading.dismiss();
            showDialog(
              context: context,
              builder: (context) {
                return const DoneScreen();
              },
            );
            Future.delayed(const Duration(seconds: 3), () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: const HomeScreen(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.fade,
              );
            });
          } else if (state is HealthinsuranceRequestErrorState) {
            EasyLoading.dismiss();
            EasyLoading.showError(state.errorMessage);
          } else if (state is HealthinsuranceRequestLoadingState) {
            EasyLoading.show(status: 'loading...');
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: MedicalAppBar(context),
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
                            Center(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<String>(
                                  isExpanded: true,
                                  hint: Text(
                                    AppLocalizations.of(context)!.annuallimit,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  items: annual
                                      .map((String annual) =>
                                          DropdownMenuItem<String>(
                                            value: annual,
                                            child: Text(
                                              annual,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  value: selectedValue,
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectedValue = value;
                                    });
                                  },
                                  buttonStyleData: ButtonStyleData(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12)),
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.grey.shade300,
                                          width: 1),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            ConfigSize.defaultSize! * 1.6),
                                    height: ConfigSize.defaultSize! * 5.5,
                                    width: ConfigSize.screenWidth,
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    height: 40,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: ConfigSize.defaultSize! * 1),
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
        ));
  }
}
