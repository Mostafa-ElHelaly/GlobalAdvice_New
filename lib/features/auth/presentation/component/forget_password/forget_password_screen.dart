import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:globaladvice_new/core/resource_manger/color_manager.dart';
import 'package:globaladvice_new/core/resource_manger/locale_keys.g.dart';
import 'package:globaladvice_new/core/utils/config_size.dart';
import 'package:globaladvice_new/core/widgets/custom_text_field.dart';
import 'package:globaladvice_new/core/widgets/main_button.dart';
import 'package:globaladvice_new/features/auth/presentation/component/forget_password/otp_screen.dart';
import 'package:globaladvice_new/features/auth/presentation/manager/reset_password_bloc/bloc/reset_password_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../core/resource_manger/routs_manager.dart';
import '../../../../../core/widgets/snack_bar.dart';
import '../../manager/reset_password_bloc/bloc/reset_password_event.dart';
import '../../manager/reset_password_bloc/bloc/reset_password_state.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordBloc, ResetPasswordState>(
        listener: (context, state) {
          if (state is Resetpasswordsuccess) {
            EasyLoading.dismiss();
            Navigator.pushNamed(
              context,
              Routes.otpScreen,
            );
          } else if (state is Changingfailedstate) {
            EasyLoading.dismiss();
            EasyLoading.showError(state.errorMessage);
          } else if (state is Loadingchangingpasswordstate) {
            EasyLoading.show(status: 'loading...');
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: ColorManager.mainColor,
              ),
            ),
            centerTitle: true,
            title: Text(
              StringManager.forgetPassword2.tr(),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: ConfigSize.defaultSize! * 2,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(ConfigSize.defaultSize! * 1.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringManager.forgetPasswordHint.tr(),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: ConfigSize.defaultSize! * 1.5,
                  ),
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! * 2,
                ),
                Text(
                  StringManager.enterYourEmail.tr(),
                  style: TextStyle(
                    fontSize: ConfigSize.defaultSize! * 1.4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! - 5,
                ),
                CustomTextField(
                  controller: emailController,
                  inputType: TextInputType.emailAddress,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: ConfigSize.defaultSize! * 3),
                  child: MainButton(
                    onTap: () {
                      if (validation()) {
                        BlocProvider.of<ResetPasswordBloc>(context).add(
                          ResetPasswordEvent(email: emailController.text),
                        );
                      } else {
                        errorSnackBar(context, StringManager.errorFillFields);
                      }
                    },
                    title: StringManager.sendCode.tr(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  bool validation() {
    if (emailController.text == '') {
      return false;
    } else {
      return true;
    }
  }
}
