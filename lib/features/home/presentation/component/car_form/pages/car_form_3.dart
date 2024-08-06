import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globaladvice_new/core/resource_manger/color_manager.dart';
import 'package:globaladvice_new/core/widgets/snack_bar.dart';
import 'package:globaladvice_new/features/home/presentation/component/car_form/widgets/car_insurance_appbar.dart';
import 'package:globaladvice_new/features/home/presentation/manager/car_data_bloc/car_data_bloc.dart';
import 'package:globaladvice_new/features/home/presentation/manager/car_insurance/carinsurance_bloc.dart';
import 'package:globaladvice_new/features/home/presentation/manager/car_insurance/carinsurance_state.dart';

import 'package:globaladvice_new/core/resource_manger/asset_path.dart';
import 'package:globaladvice_new/core/resource_manger/routs_manager.dart';
import 'package:globaladvice_new/core/utils/config_size.dart';
import 'package:globaladvice_new/core/widgets/main_button.dart';
import 'package:globaladvice_new/features/home/presentation/manager/car_data_bloc/car_data_event.dart';
import 'package:globaladvice_new/features/home/presentation/manager/car_data_bloc/car_data_state.dart';
import 'package:globaladvice_new/features/home/presentation/manager/car_insurance/carinsurance_event.dart';
import 'package:globaladvice_new/features/home/presentation/component/life_form/widgets/Back_Button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CarForm3 extends StatefulWidget {
  const CarForm3(
      {super.key,
      required this.price,
      required this.is_licenced,
      required this.phoneNumber});
  final int price;
  final String is_licenced;
  final String phoneNumber;

  @override
  State<CarForm3> createState() => _CarForm3State();
}

class _CarForm3State extends State<CarForm3> {
  String? selectedValue3;
  String? selectedValue4;
  String? selectedValue5;
  int motor_Brands_index = 0;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CarDataBloc>(context).add(GetallcardataEvent());
  }

  @override
  Widget build(BuildContext context) {

    return BlocListener<CarinsuranceBloc, CarinsuranceblocState>(
      listener: (context, state) {
        if (state is CarInsuranceSuccessState) {
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
        }
        if (state is CarinsuranceRequestErrorState) {
          errorSnackBar(context, state.errorMessage);
        }
        if (state is CarinsuranceRequestLoadingState) {
          const Center(
            child: CircularProgressIndicator(
              color: ColorManager.mainColor,
            ),
          );
        }
      },
      child: Scaffold(
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
                          BlocBuilder<CarDataBloc, CarDataState>(
                            builder: (context, state) {
                              if (state is CarDataSuccessState) {
                                // Create a list of dropdown items
                                List<DropdownMenuItem<String>> dropdownItems =
                                    state.CarDependinces.where((element) =>
                                            element.id == 'motorBrands')
                                        .expand((car) {
                                  // Extract `id` and `name` to be used as values and labels
                                  return car.plansDataValues!.map((e) {
                                    return DropdownMenuItem<String>(
                                      value: e.id
                                          .toString(), // Ensure value is not null
                                      child: Text(
                                        e.name?.toUpperCase() ?? 'Unknown',
                                        style: TextStyle(
                                          fontSize:
                                              ConfigSize.defaultSize! * 1.6,
                                          fontWeight: FontWeight.bold,
                                          color: ColorManager.mainColor,
                                        ),
                                      ),
                                    );
                                  }).toList();
                                }).toList();

                                return Center(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2<String>(
                                      isExpanded: true,
                                      hint: Text(
                                        AppLocalizations.of(context)!.carbrand,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context).hintColor,
                                        ),
                                      ),
                                      items: dropdownItems,
                                      value:
                                          selectedValue3, // Set this to the currently selected value
                                      onChanged: (String? value) {
                                        setState(() {
                                          selectedValue3 = value;
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
                                      menuItemStyleData:
                                          const MenuItemStyleData(
                                        height: 40,
                                      ),
                                    ),
                                  ),
                                );
                              } else if (state is CarDataErrorState) {
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
                          SizedBox(height: ConfigSize.defaultSize! * 2),
                          BlocBuilder<CarDataBloc, CarDataState>(
                            builder: (context, state) {
                              if (state is CarDataSuccessState) {
                                // Create a list of dropdown items
                                List<DropdownMenuItem<String>> dropdownItems =
                                    state.CarDependinces.where((element) =>
                                            element.id == 'motorDeductibles')
                                        .expand((car) {
                                  // Extract `id` and `name` to be used as values and labels
                                  return car.plansDataValues!.map((e) {
                                    return DropdownMenuItem<String>(
                                      value: e.id
                                          .toString(), // Ensure value is not null
                                      child: Text(
                                        e.name?.toUpperCase() ?? 'Unknown',
                                        style: TextStyle(
                                          fontSize:
                                              ConfigSize.defaultSize! * 1.6,
                                          fontWeight: FontWeight.bold,
                                          color: ColorManager.mainColor,
                                        ),
                                      ),
                                    );
                                  }).toList();
                                }).toList();

                                return Center(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2<String>(
                                      isExpanded: true,
                                      hint: Text(
                                        AppLocalizations.of(context)!
                                            .motorDeductibles,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context).hintColor,
                                        ),
                                      ),
                                      items: dropdownItems,
                                      value:
                                          selectedValue4, // Set this to the currently selected value
                                      onChanged: (String? value) {
                                        setState(() {
                                          selectedValue4 = value;
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
                                      menuItemStyleData:
                                          const MenuItemStyleData(
                                        height: 40,
                                      ),
                                    ),
                                  ),
                                );
                              } else if (state is CarDataErrorState) {
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
                          SizedBox(height: ConfigSize.defaultSize! * 2),
                          BlocBuilder<CarDataBloc, CarDataState>(
                            builder: (context, state) {
                              if (state is CarDataSuccessState) {
                                // Create a list of dropdown items
                                List<DropdownMenuItem<String>> dropdownItems =
                                    state.CarDependinces.where((element) =>
                                        element.id ==
                                        'motorManufactureYear').expand((car) {
                                  // Extract `id` and `name` to be used as values and labels
                                  return car.plansDataValues!.map((e) {
                                    return DropdownMenuItem<String>(
                                      value: e.id
                                          .toString(), // Ensure value is not null
                                      child: Text(
                                        e.name?.toUpperCase() ?? 'Unknown',
                                        style: TextStyle(
                                          fontSize:
                                              ConfigSize.defaultSize! * 1.6,
                                          fontWeight: FontWeight.bold,
                                          color: ColorManager.mainColor,
                                        ),
                                      ),
                                    );
                                  }).toList();
                                }).toList();

                                return Center(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2<String>(
                                      isExpanded: true,
                                      hint: Text(
                                        AppLocalizations.of(context)!
                                            .manufactureYear,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context).hintColor,
                                        ),
                                      ),
                                      items: dropdownItems,
                                      value:
                                          selectedValue5, // Set this to the currently selected value
                                      onChanged: (String? value) {
                                        setState(() {
                                          selectedValue5 = value;
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
                                      menuItemStyleData:
                                          const MenuItemStyleData(
                                        height: 40,
                                      ),
                                    ),
                                  ),
                                );
                              } else if (state is CarDataErrorState) {
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
                          SizedBox(height: ConfigSize.defaultSize! * 2),
                          SizedBox(height: ConfigSize.defaultSize! * 2),
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
                      BlocProvider.of<CarinsuranceBloc>(context)
                          .add(CarinsuranceblocEvent(
                        isLicensed: widget.is_licenced,
                        motorBrands: int.parse(selectedValue3!),
                        motorDeductibles: int.parse(selectedValue4!),
                        motorManufactureYear: int.parse(selectedValue5!),
                        phone: widget.phoneNumber,
                        price: widget.price,
                      ));
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
}
