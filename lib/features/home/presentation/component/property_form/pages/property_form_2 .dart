import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:globaladvice_new/features/home/presentation/component/car_form/pages/car_form_3.dart';
import 'package:globaladvice_new/features/home/presentation/component/car_form/widgets/Motor_Dropdown_Widget.dart';
import 'package:globaladvice_new/features/home/presentation/component/car_form/widgets/car_insurance_appbar.dart';
import 'package:globaladvice_new/features/home/presentation/component/property_form/pages/property_form_3%20.dart';
import 'package:globaladvice_new/features/home/presentation/component/property_form/widgets/Prop_insurance_appbar.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../../core/resource_manger/asset_path.dart';
import '../../../../../../core/resource_manger/locale_keys.g.dart';
import '../../../../../../core/utils/config_size.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../core/widgets/main_button.dart';

class PropertyForm2 extends StatefulWidget {
  const PropertyForm2({super.key});

  @override
  State<PropertyForm2> createState() => _PropertyForm2State();
}

class _PropertyForm2State extends State<PropertyForm2> {
  TextEditingController emailController = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController contentpricecontroller = TextEditingController();
  TextEditingController buildingpricecontroller = TextEditingController();

  String? selectedValue;
  @override
  void initState() {
    emailController = TextEditingController();
    addresscontroller = TextEditingController();
    contentpricecontroller = TextEditingController();
    buildingpricecontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    addresscontroller.dispose();
    contentpricecontroller.dispose();
    buildingpricecontroller.dispose();
    super.dispose();
  }

  final List<String> type = [
    'Owner',
    'Tenant',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                labeltext: StringManager.email.tr(),
                prefixicon: const Icon(Icons.email_rounded),
                controller: emailController,
                inputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: ConfigSize.defaultSize! * 2,
              ),
              CarDropdown(
                selectedValue: selectedValue,
                label: StringManager.type.tr(),
                list: type,
                onChanged: (String? value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
              ),
              selectedValue == 'Owner'
                  ? SizedBox(
                      height: ConfigSize.defaultSize! * 2,
                    )
                  : SizedBox.shrink(),
              Visibility(
                visible: selectedValue == 'Owner' ? true : false,
                child: CustomTextField(
                  labeltext: StringManager.buildingprice.tr(),
                  prefixicon: const Icon(Icons.house_rounded),
                  controller: buildingpricecontroller,
                  inputType: TextInputType.text,
                ),
              ),
              selectedValue == 'Owner' || selectedValue == 'Tenant'
                  ? SizedBox(
                      height: ConfigSize.defaultSize! * 2,
                    )
                  : SizedBox.shrink(),
              Visibility(
                visible: selectedValue == 'Owner' || selectedValue == 'Tenant',
                child: CustomTextField(
                  labeltext: StringManager.contentprice.tr(),
                  prefixicon: const Icon(Icons.price_change),
                  controller: contentpricecontroller,
                  inputType: TextInputType.text,
                ),
              ),
              SizedBox(
                height: ConfigSize.defaultSize! * 2,
              ),
              CustomTextField(
                labeltext: StringManager.address.tr(),
                prefixicon: const Icon(Icons.pin_drop),
                controller: addresscontroller,
                inputType: TextInputType.text,
              ),
              SizedBox(
                height: ConfigSize.defaultSize! * 2,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: ConfigSize.defaultSize! * 2),
                child: MainButton(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: PropertyForm3(),
                      withNavBar: false,
                      pageTransitionAnimation: PageTransitionAnimation.fade,
                    );
                  },
                  title: StringManager.next.tr(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
