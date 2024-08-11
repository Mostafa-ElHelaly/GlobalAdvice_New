import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globaladvice_new/core/resource_manger/color_manager.dart';
import 'package:globaladvice_new/core/resource_manger/locale_keys.g.dart';
import 'package:globaladvice_new/core/utils/translation_provider.dart';
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
import 'package:globaladvice_new/features/home/presentation/manager/property_data_bloc/property_data_bloc.dart';
import 'package:globaladvice_new/features/home/presentation/manager/property_data_bloc/property_data_event.dart';
import 'package:globaladvice_new/features/home/presentation/manager/property_data_bloc/property_data_state.dart';
import 'package:globaladvice_new/features/home/presentation/manager/property_insurance.dart/property_insurance_bloc.dart';
import 'package:globaladvice_new/features/home/presentation/manager/property_insurance.dart/property_insurance_event.dart';
import 'package:globaladvice_new/features/home/presentation/manager/property_insurance.dart/property_insurance_state.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PropertyForm3 extends StatefulWidget {
  const PropertyForm3(
      {super.key,
      required this.buildingPrice,
      required this.contentPrice,
      this.phone_number,
      this.type});
  final int buildingPrice;
  final int contentPrice;
  final String? phone_number;
  final String? type;

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
  late SharedPreferences prefs;
  List<bool> get_checked(int index) {
    List<bool> homeBenefitsSet = List.generate(index, (index) => false);

    return homeBenefitsSet;
  }

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
    _scrollController = ScrollController();
    BlocProvider.of<PropertyDataBloc>(context).add(GetallPropertydataEvent());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool intToBool(int value) {
    return value != 0;
  }

  List<List<bool>> _checkboxValues = [];

  void _initializeCheckboxValues() {
    _checkboxValues = List.generate(
      state.PropertyDependinces.length,
      (index) => List.generate(
        state.PropertyDependinces[index].plansDataValues!.length,
        (index2) => false, // Initial value for each checkbox
      ),
    );
  }

  Future<void> _initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(
        () {}); // Ensure the state is updated after SharedPreferences is initialized
  }

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
    List<bool> _checkboxValues = List.generate(14, (index) => false);

    Set homeBenefitsSet = Set();
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
                          BlocBuilder<PropertyDataBloc, PropertyDataState>(
                            builder: (context, state) {
                              if (state is PropertyDataSuccessState) {
                                return Container(
                                  height: ConfigSize.defaultSize! * 45,
                                  child: ListView.builder(
                                    physics: ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: state.PropertyDependinces.length,
                                    itemBuilder: (context, index) {
                                      return ListView.builder(
                                        physics: ClampingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: state
                                            .PropertyDependinces[index]
                                            .plansDataValues!
                                            .length,
                                        itemBuilder: (context, index2) {
                                          return CheckboxListTile(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        ConfigSize
                                                                .defaultSize! *
                                                            1.5)),
                                            activeColor: ColorManager.mainColor,
                                            checkColor: ColorManager.whiteColor,
                                            value: _checkboxValues[index],
                                            onChanged: (bool? value) {
                                              setState(() {
                                                _checkboxValues[index] = true;
                                              });

                                              if (value == true) {
                                                homeBenefitsSet.add(
                                                  state
                                                      .PropertyDependinces[
                                                          index]
                                                      .plansDataValues![index2]
                                                      .id!,
                                                );
                                              } else {
                                                homeBenefitsSet.remove(
                                                  state
                                                      .PropertyDependinces[
                                                          index]
                                                      .plansDataValues![index2]
                                                      .id!,
                                                );
                                              }
                                            },
                                            title: Text(state
                                                .PropertyDependinces[index]
                                                .plansDataValues![index2]
                                                .name!),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              } else if (state is PropertyDataErrorState) {
                                return Text(state.errorMessage);
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: ColorManager.mainColor,
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ConfigSize.defaultSize! * 2),
                Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: ConfigSize.defaultSize! * 1),
                    child: Consumer<TranslationProvider>(
                      builder: (context, getuid, child) {
                        return MainButton(
                          onTap: () {
                            if (validation()) {
                              BlocProvider.of<PropertyInsuranceBloc>(context)
                                  .add(
                                PropertyInsuranceBlocEvent(
                                  phone: widget.phone_number!,
                                  uid: prefs.getString("user_uid")!,
                                  buildingPrice: widget.buildingPrice,
                                  contentPrice: widget.contentPrice,
                                  type: widget.type!,
                                  homeBenefits:
                                      homeBenefitsSet.toList().cast<int>(),
                                ),
                              );
                            } else {
                              errorSnackBar(
                                  context, StringManager.errorFillFields);
                            }
                          },
                          title: AppLocalizations.of(context)!.submit,
                        );
                      },
                    )),
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
