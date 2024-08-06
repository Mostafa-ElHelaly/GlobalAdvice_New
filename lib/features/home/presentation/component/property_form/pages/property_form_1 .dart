import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globaladvice_new/core/resource_manger/asset_path.dart';
import 'package:globaladvice_new/core/utils/config_size.dart';
import 'package:globaladvice_new/core/widgets/Loading.dart';
import 'package:globaladvice_new/core/widgets/custom_text_field.dart';
import 'package:globaladvice_new/core/widgets/snack_bar.dart';
import 'package:globaladvice_new/features/home/presentation/component/property_form/pages/property_form_2%20.dart';
import 'package:globaladvice_new/features/home/presentation/manager/property_insurance.dart/property_insurance_bloc.dart';
import 'package:globaladvice_new/features/home/presentation/manager/property_insurance.dart/property_insurance_state.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:globaladvice_new/core/widgets/Custom_Drawer.dart';
import 'package:globaladvice_new/core/widgets/main_button.dart';

import 'package:globaladvice_new/core/resource_manger/routs_manager.dart';

class PropertyFormMainPersonData extends StatefulWidget {
  const PropertyFormMainPersonData({super.key});

  @override
  State<PropertyFormMainPersonData> createState() =>
      _PropertyFormMainPersonDataState();
}

class _PropertyFormMainPersonDataState
    extends State<PropertyFormMainPersonData> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    fullNameController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<PropertyInsuranceBloc, PropertyInsuranceBlocState>(
      listener: (context, state) {
        if (state is PropertyInsuranceSuccessState) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.propertyForm2, (route) => false);
        } else if (state is PropertyInsuranceRequestErrorState) {
          errorSnackBar(context, state.errorMessage);
        } else if (state is PropertyInsuranceBlocRequestLoadingState) {
          showLoading(context);
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const CustomDrawer(),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            iconSize: 32, // Adjust the size as needed
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          centerTitle: true,
          title: Image.asset(
            AssetsPath.logo,
            scale: 10,
          ),
        ),
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
                  labeltext: AppLocalizations.of(context)!.fullName,
                  prefixicon: const Icon(Icons.person),
                  controller: fullNameController,
                  inputType: TextInputType.name,
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! * 2,
                ),
                CustomTextField(
                  labeltext: AppLocalizations.of(context)!.phonenumber,
                  prefixicon: const Icon(Icons.phone_android_sharp),
                  controller: phoneController,
                  inputType: TextInputType.phone,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: ConfigSize.defaultSize! * 3),
                  child: MainButton(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const PropertyForm2(),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.fade,
                      );
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
    if (fullNameController.text == '') {
      return false;
    } else if (phoneController.text == '') {
      return false;
    } else {
      return true;
    }
  }
}
