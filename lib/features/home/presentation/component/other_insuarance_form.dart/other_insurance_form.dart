import 'dart:ffi';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globaladvice_new/core/resource_manger/color_manager.dart';
import 'package:globaladvice_new/core/resource_manger/routs_manager.dart';
import 'package:globaladvice_new/core/utils/config_size.dart';
import 'package:globaladvice_new/core/widgets/custom_text_field.dart';
import 'package:globaladvice_new/core/widgets/main_button.dart';
import 'package:globaladvice_new/core/widgets/snack_bar.dart';
import 'package:globaladvice_new/features/home/presentation/component/life_form/widgets/Back_Button.dart';
import 'package:globaladvice_new/features/home/presentation/manager/other_forms_bloc/other_forms_bloc.dart';

import '../../../../../core/resource_manger/asset_path.dart';
import '../../../../../core/widgets/Custom_Drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/widgets/Loading.dart';
import '../../manager/other_forms_bloc/other_forms_event.dart';
import '../../manager/other_forms_bloc/other_forms_state.dart';

class OtherInsuranceForm extends StatefulWidget {
  const OtherInsuranceForm({super.key, required this.Insurance_type});
  final String Insurance_type;

  @override
  State<OtherInsuranceForm> createState() => _OtherInsuranceFormState();
}

class _OtherInsuranceFormState extends State<OtherInsuranceForm> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextStyle labelstyle = TextStyle(
    fontSize: ConfigSize.defaultSize! * 2,
    fontWeight: FontWeight.w700,
  );
  @override
  void initState() {
    namecontroller = TextEditingController();
    phonenumberController = TextEditingController();
    print(widget.Insurance_type);
    super.initState();
  }

  @override
  void dispose() {
    namecontroller.dispose();
    phonenumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtherInsuranceBloc, OtherinsuranceblocState>(
        listener: (context, state) {
          if (state is OtherInsuranceSuccessState) {
            AwesomeDialog(
                    context: context,
                    dialogType: DialogType.success,
                    animType: AnimType.rightSlide,
                    desc: AppLocalizations.of(context)!.lifeinsurancerequest,
                    btnOkOnPress: () {},
                    btnOk: const CustomBackButton())
                .show();
            Future.delayed(Duration(seconds: 3), () {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.homeScreen, (route) => false);
            });
          } else if (state is OtherinsuranceRequestErrorState) {
            errorSnackBar(context, state.errorMessage);
          }
        },
        child: Scaffold(
          backgroundColor: ColorManager.whiteColor,
          drawer: const CustomDrawer(),
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: ColorManager.whiteColor,
            leading: IconButton(
              icon: const Icon(Icons.menu),
              iconSize:
                  ConfigSize.defaultSize! * 4, // Adjust the size as needed
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
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(ConfigSize.defaultSize! * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: ConfigSize.defaultSize! * 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetsPath.logo,
                        scale: 5,
                      ),
                    ],
                  ),
                  SizedBox(height: ConfigSize.defaultSize! * 2),
                  Text(
                    AppLocalizations.of(context)!.fullName,
                    style: labelstyle,
                  ),
                  SizedBox(height: ConfigSize.defaultSize! * 2),
                  CustomTextField(
                      controller: namecontroller,
                      inputType: TextInputType.name),
                  SizedBox(height: ConfigSize.defaultSize! * 2),
                  Text(
                    AppLocalizations.of(context)!.phonenumber,
                    style: labelstyle,
                  ),
                  SizedBox(height: ConfigSize.defaultSize! * 2),
                  CustomTextField(
                      controller: phonenumberController,
                      inputType: TextInputType.phone),
                  SizedBox(height: ConfigSize.defaultSize! * 2),
                  MainButton(
                      onTap: () {
                        BlocProvider.of<OtherInsuranceBloc>(context)
                            .add(OtherinsuranceblocEvent(
                          name: namecontroller.text,
                          phonenumber: phonenumberController.text,
                          type: widget.Insurance_type,
                          message: 'I Need ${widget.Insurance_type} Insurance',
                        ));
                      },
                      title: AppLocalizations.of(context)!.submit)
                ],
              ),
            ),
          ),
        ));
  }
}
