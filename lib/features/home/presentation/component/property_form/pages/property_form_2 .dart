import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globaladvice_new/core/resource_manger/locale_keys.g.dart';
import 'package:globaladvice_new/core/resource_manger/routs_manager.dart';
import 'package:globaladvice_new/core/widgets/Loading.dart';
import 'package:globaladvice_new/core/widgets/snack_bar.dart';
import 'package:globaladvice_new/features/home/presentation/component/car_form/widgets/Motor_Dropdown_Widget.dart';
import 'package:globaladvice_new/features/home/presentation/component/property_form/widgets/Prop_insurance_appbar.dart';
import 'package:globaladvice_new/features/home/presentation/manager/property_insurance.dart/property_insurance_bloc.dart';
import 'package:globaladvice_new/features/home/presentation/manager/property_insurance.dart/property_insurance_event.dart';
import 'package:globaladvice_new/features/home/presentation/manager/property_insurance.dart/property_insurance_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:globaladvice_new/core/resource_manger/asset_path.dart';
import 'package:globaladvice_new/core/utils/config_size.dart';
import 'package:globaladvice_new/core/widgets/custom_text_field.dart';
import 'package:globaladvice_new/core/widgets/main_button.dart';

class PropertyForm2 extends StatefulWidget {
  const PropertyForm2({super.key});

  @override
  State<PropertyForm2> createState() => _PropertyForm2State();
}

class _PropertyForm2State extends State<PropertyForm2> {
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contentPriceController = TextEditingController();
  TextEditingController buildingPriceController = TextEditingController();

  String? selectedValue;

  @override
  void initState() {
    emailController = TextEditingController();
    addressController = TextEditingController();
    contentPriceController = TextEditingController();
    buildingPriceController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    addressController.dispose();
    contentPriceController.dispose();
    buildingPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> type = [
      AppLocalizations.of(context)!.owner,
      AppLocalizations.of(context)!.tenant,
    ];
    return BlocListener<PropertyInsuranceBloc, PropertyInsuranceBlocState>(
      listener: (context, state) {
        if (state is PropertyInsuranceSuccessState) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.propertyForm3, (route) => false);
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
                  labeltext: AppLocalizations.of(context)!.email,
                  prefixicon: const Icon(Icons.email_rounded),
                  controller: emailController,
                  inputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! * 2,
                ),
                CarDropdown(
                  selectedValue: selectedValue,
                  label: AppLocalizations.of(context)!.type,
                  list: type,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                ),
                selectedValue == AppLocalizations.of(context)!.owner
                    ? SizedBox(
                        height: ConfigSize.defaultSize! * 2,
                      )
                    : const SizedBox.shrink(),
                Visibility(
                  visible: selectedValue == AppLocalizations.of(context)!.owner
                      ? true
                      : false,
                  child: CustomTextField(
                    labeltext: AppLocalizations.of(context)!.buildingprice,
                    prefixicon: const Icon(Icons.house_rounded),
                    controller: buildingPriceController,
                    inputType: TextInputType.text,
                  ),
                ),
                selectedValue == AppLocalizations.of(context)!.owner ||
                        selectedValue == AppLocalizations.of(context)!.tenant
                    ? SizedBox(
                        height: ConfigSize.defaultSize! * 2,
                      )
                    : const SizedBox.shrink(),
                Visibility(
                  visible:
                      selectedValue == AppLocalizations.of(context)!.owner ||
                          selectedValue == AppLocalizations.of(context)!.tenant,
                  child: CustomTextField(
                    labeltext: AppLocalizations.of(context)!.contentprice,
                    prefixicon: const Icon(Icons.price_change),
                    controller: contentPriceController,
                    inputType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! * 2,
                ),
                CustomTextField(
                  labeltext: AppLocalizations.of(context)!.address,
                  prefixicon: const Icon(Icons.pin_drop),
                  controller: addressController,
                  inputType: TextInputType.text,
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! * 2,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: ConfigSize.defaultSize! * 2),
                  child: MainButton(
                    onTap: () {
                      if (validation()) {
                        BlocProvider.of<PropertyInsuranceBloc>(context).add(
                          PropertyInsuranceBlocEvent(
                            name: '',
                            phone: '',
                            uid: '',
                            buildingPrice: selectedValue == AppLocalizations.of(context)!.tenant ? 0 :
                                int.parse(buildingPriceController.text),

                            // selectedValue == AppLocalizations.of(context)!.owner
                            //     ? int.parse(buildingPriceController.text)
                            //     : int.parse(''),

                            contentPrice:
                                int.parse(contentPriceController.text),
                            type: '',
                            homeBenefits: [],
                          ),
                        );
                      } else {
                        errorSnackBar(context, StringManager.errorFillFields);
                      }
                    },
                    title: AppLocalizations.of(context)!.next,
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
    if (emailController.text == '') {
      return false;
    } else if (addressController.text == '') {
      return false;
    } else if (selectedValue == AppLocalizations.of(context)!.tenant &&
        buildingPriceController.text == '') {
      return true;
    } else if (contentPriceController.text == '') {
      return false;
    } else {
      return true;
    }
  }
}
