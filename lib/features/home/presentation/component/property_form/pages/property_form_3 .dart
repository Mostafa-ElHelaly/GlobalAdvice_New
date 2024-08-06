import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globaladvice_new/core/resource_manger/color_manager.dart';
import 'package:globaladvice_new/core/resource_manger/locale_keys.g.dart';
import 'package:globaladvice_new/core/widgets/Loading.dart';
import 'package:globaladvice_new/core/widgets/snack_bar.dart';
import 'package:globaladvice_new/features/home/presentation/component/property_form/widgets/Prop_insurance_appbar.dart';
import 'package:globaladvice_new/features/home/presentation/component/property_form/widgets/Property_Checkbox.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:globaladvice_new/core/resource_manger/asset_path.dart';
import 'package:globaladvice_new/core/resource_manger/routs_manager.dart';
import 'package:globaladvice_new/core/utils/config_size.dart';
import 'package:globaladvice_new/core/widgets/main_button.dart';
import 'package:globaladvice_new/features/home/presentation/component/life_form/widgets/Back_Button.dart';
import 'package:globaladvice_new/features/home/presentation/manager/property_insurance.dart/property_insurance_bloc.dart';
import 'package:globaladvice_new/features/home/presentation/manager/property_insurance.dart/property_insurance_event.dart';
import 'package:globaladvice_new/features/home/presentation/manager/property_insurance.dart/property_insurance_state.dart';

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
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<String> Homedata = [
    'Burglary or attempted theft of contents',
    'Fire, lightning, and explosion',
    'Bursting of water tanks',
    'Damage of gas pipeline',
    'Strikes and riots',
    'Loss of rent',
    'Burglary or attempted theft of contents',
  ];


  @override
  Widget build(BuildContext context) {
    List<String> HomeData = [
      AppLocalizations.of(context)!.burglaryorattemptedtheftofcontents,
      AppLocalizations.of(context)!.fireorexplosion,
      AppLocalizations.of(context)!.burstingofwatertanks,
      AppLocalizations.of(context)!.damageofgaspipeline,
      AppLocalizations.of(context)!.strikesandriots,
      AppLocalizations.of(context)!.lossofrent,
    ];
    List<bool> bools = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
    ];
    final List<bool> booleanList = List.generate(HomeData.length, (_) => false);

    return BlocListener<PropertyInsuranceBloc, PropertyInsuranceBlocState>(
      listener: (context, state) {
        if (state is PropertyInsuranceSuccessState) {
          AwesomeDialog(
                  context: context,
                  dialogType: DialogType.success,
                  animType: AnimType.rightSlide,
                  desc: AppLocalizations.of(context)!.lifeinsurancerequest,
                  btnOkOnPress: () {},
                  btnOk: const CustomBackButton())
              .show();
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.homeScreen, (route) => false);
          });
        } else if (state is PropertyInsuranceRequestErrorState) {
          errorSnackBar(context, state.errorMessage);
        } else if (state is PropertyInsuranceBlocRequestLoadingState) {
          showLoading(context);
        }
      },
      child: Scaffold(
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
                              controller: _scrollController,
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: HomeData.length,
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
                                  title: HomeData[index],
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
                  padding: EdgeInsets.symmetric(
                      vertical: ConfigSize.defaultSize! * 1),
                  child: MainButton(
                    onTap: () {
                      if (validation()) {
                        BlocProvider.of<PropertyInsuranceBloc>(context).add(
                          PropertyInsuranceBlocEvent(
                            name: '',
                            phone: '',
                            uid: '',
                            buildingPrice: null ?? 1,
                            contentPrice: null ?? 1,
                            type: '',
                            homeBenefits:  [_scrollController.hashCode],
                          ),
                        );
                      } else {
                        errorSnackBar(context, StringManager.errorFillFields);
                      }
                    },
                    title: AppLocalizations.of(context)!.submit,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validation() {
    if (_scrollController == '') {
      return false;
    } else {
      return true;
    }
  }
}
