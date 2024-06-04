import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:globaladvice_new/core/resource_manger/asset_path.dart';
import 'package:globaladvice_new/core/resource_manger/color_manager.dart';
import 'package:globaladvice_new/core/resource_manger/locale_keys.g.dart';
import 'package:globaladvice_new/core/utils/config_size.dart';
import 'package:globaladvice_new/core/widgets/custom_text_field.dart';
import 'package:globaladvice_new/core/widgets/main_button.dart';
import 'package:globaladvice_new/features/auth/presentation/component/create_account/create_account_screen.dart';
import 'package:globaladvice_new/features/auth/presentation/component/forget_password/forget_password_screen.dart';
import 'package:globaladvice_new/main_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: ConfigSize.defaultSize! * 10,
          ),
          Image.asset(
            AssetsPath.logo,
            scale: 4,
          ),
          SizedBox(
            height: ConfigSize.defaultSize! * 4,
          ),
          Padding(
            padding: EdgeInsets.all(ConfigSize.defaultSize! * 1.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringManager.email.tr(),
                  style: TextStyle(
                    fontSize: ConfigSize.defaultSize! * 1.6,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! - 5,
                ),
                CustomTextField(
                  controller: phoneController,
                  inputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! * 2,
                ),
                Text(
                  StringManager.password.tr(),
                  style: TextStyle(
                    fontSize: ConfigSize.defaultSize! * 1.6,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! - 5,
                ),
                CustomTextField(
                  controller: passwordController,
                  inputType: TextInputType.text,
                  obscureText: true,
                  suffix: const Icon(Icons.remove_red_eye_outlined),
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! * 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: const ForgetPasswordScreen(),
                          withNavBar: false,
                          pageTransitionAnimation: PageTransitionAnimation.fade,
                        );
                      },
                      child: Text(
                        StringManager.forgetPassword.tr(),
                        style: TextStyle(
                          fontSize: ConfigSize.defaultSize! * 1.6,
                          fontWeight: FontWeight.w600,
                          color: ColorManager.mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: ConfigSize.defaultSize! * 3),
                  child: MainButton(
                    color: ColorManager.kPrimaryBlueDark,
                    textColor: ColorManager.whiteColor,
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const MainScreen(),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.fade,
                      );
                    },
                    title: StringManager.login.tr(),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.all(ConfigSize.defaultSize! * 1.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringManager.dontHaveAccount.tr(),
                  style: const TextStyle(
                    color: ColorManager.gray,
                  ),
                ),
                InkWell(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: const CreateAccount(),
                      withNavBar: false,
                      pageTransitionAnimation: PageTransitionAnimation.fade,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorManager.gray,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: ConfigSize.defaultSize! * 1.5,
                        horizontal: ConfigSize.defaultSize! * 3,
                      ),
                      child: Text(
                        StringManager.createAccount.tr(),
                        style: TextStyle(
                          color: ColorManager.kPrimaryBlueDark,
                          fontWeight: FontWeight.bold,
                          fontSize: ConfigSize.defaultSize! * 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool validation() {
    if (phoneController.text == '') {
      return false;
    } else if (passwordController.text == '') {
      return false;
    } else {
      return true;
    }
  }
}
