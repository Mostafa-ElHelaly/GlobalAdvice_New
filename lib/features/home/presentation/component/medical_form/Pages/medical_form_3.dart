import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:globaladvice_new/core/widgets/Loading.dart';
import 'package:globaladvice_new/features/home/presentation/component/medical_form/Widgets/done.dart';
import 'package:globaladvice_new/features/home/presentation/component/medical_form/Widgets/medical_appbar.dart';
import 'package:globaladvice_new/features/home/presentation/manager/health_data/health_data_bloc.dart';
import 'package:globaladvice_new/features/home/presentation/manager/health_data/health_data_state.dart';
import 'package:globaladvice_new/features/home/presentation/manager/health_insurance_request/healthinsurancebloc_bloc.dart';
import 'package:globaladvice_new/features/home/presentation/manager/health_insurance_request/healthinsurancebloc_event.dart';
import 'package:globaladvice_new/features/home/presentation/manager/health_insurance_request/healthinsurancebloc_state.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:globaladvice_new/core/resource_manger/asset_path.dart';
import 'package:globaladvice_new/core/resource_manger/routs_manager.dart';
import 'package:globaladvice_new/core/utils/config_size.dart';
import 'package:globaladvice_new/core/widgets/main_button.dart';
import 'package:globaladvice_new/features/home/presentation/home_screen.dart';
import 'package:globaladvice_new/features/home/presentation/component/life_form/widgets/Back_Button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/resource_manger/color_manager.dart';
import '../../../../../../core/widgets/snack_bar.dart';
import '../../../manager/health_data/health_data_event.dart';
import 'Mdeical_Prices.dart';

class MedicalForm3 extends StatefulWidget {
  const MedicalForm3({
    super.key,
    required this.phone,
    required this.relations,
    this.ages,
    this.names,
    required this.gender,
  });
  final String phone;
  final String gender;
  final List<String?> relations;
  final List<int>? ages;
  final List<String>? names;

  @override
  State<MedicalForm3> createState() => _MedicalForm3State();
}

class _MedicalForm3State extends State<MedicalForm3> {
  String? selectedValue;
  late SharedPreferences prefs;

  Future<void> _initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(
        () {}); // Ensure the state is updated after SharedPreferences is initialized
  }

  @override
  void initState() {
    print(widget.names);
    print(widget.ages);
    _initSharedPreferences();
    BlocProvider.of<HealthDataBloc>(context).add(GetallHealthDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var localetype = Localizations.localeOf(context).languageCode;

    return BlocListener<HealthinsuranceBloc, HealthinsuranceblocState>(
        listener: (context, state) {
          if (state is HealthInsuranceSuccessState) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MedicalPrices()));
          } else if (state is HealthinsuranceRequestErrorState) {
            errorSnackBar(context, state.errorMessage);
          } else if (state is HealthinsuranceRequestLoadingState) {
            showLoading(context);
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
                  BlocBuilder<HealthDataBloc, HealthDataState>(
                    builder: (context, state) {
                      if (state is HealthDataSuccessState) {
                        // Create a list of dropdown items
                        List<DropdownMenuItem<String>> dropdownItems =
                            state.HealthDependinces.where(
                                    (element) => element.id == 'healthLimit')
                                .expand((car) {
                          // Extract `id` and `name` to be used as values and labels
                          return car.plansDataValues!.map((e) {
                            return DropdownMenuItem<String>(
                              value:
                                  e.id.toString(), // Ensure value is not null
                              child: Text(
                                localetype == 'en'
                                    ? e.name?.toUpperCase() ?? 'Unknown'
                                    : e.nameAlt?.toUpperCase() ?? 'Unknown',
                                style: TextStyle(
                                  fontSize: ConfigSize.defaultSize! * 1.6,
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
                                AppLocalizations.of(context)!.annuallimit,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: dropdownItems,
                              value:
                                  selectedValue, // Set this to the currently selected value
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
                                      color: Colors.grey.shade300, width: 1),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: ConfigSize.defaultSize! * 1.6),
                                height: ConfigSize.defaultSize! * 5.5,
                                width: ConfigSize.screenWidth,
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                              ),
                            ),
                          ),
                        );
                      } else if (state is HealthDataErrorState) {
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: ConfigSize.defaultSize! * 1),
                    child: MainButton(
                      onTap: () {
                        BlocProvider.of<HealthinsuranceBloc>(context)
                            .add(HealthinsuranceblocEvent(
                          uid: prefs.getString("user_uid"),
                          name: widget.names,
                          age: widget.ages,
                          relation: widget.relations,
                          gender: widget.gender,
                          healthLimit: int.parse(selectedValue!),
                          phone: widget.phone,
                        ));
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
