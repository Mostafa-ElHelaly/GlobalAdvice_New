import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:globaladvice_new/core/resource_manger/color_manager.dart';
import 'package:globaladvice_new/features/home/presentation/component/medical_form/Widgets/Gender_Drop_Down_Widget.dart';
import 'package:globaladvice_new/features/home/presentation/component/medical_form/Widgets/medical_appbar.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../../core/resource_manger/asset_path.dart';
import '../../../../../../core/resource_manger/locale_keys.g.dart';
import '../../../../../../core/utils/config_size.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../core/widgets/main_button.dart';

import '../../../home_screen.dart';
import 'medical_form_3.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MedicalForm2 extends StatefulWidget {
  const MedicalForm2({super.key});

  @override
  State<MedicalForm2> createState() => _MedicalForm2State();
}

class _MedicalForm2State extends State<MedicalForm2> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController siblingbirthdayController = TextEditingController();
  FocusNode _focusNode = FocusNode();

  String? selectedValue;
  String? siblinggenderselectedValue;
  String? siblingrelationselectedValue;

  DateTime selectedDate = DateTime.now();
  int addcount = 0;
  List<TextEditingController> birthdayControllers = [];
  List<TextEditingController> fullnameControllers = [];
  List<String?> genderselectedValues =
      []; // Initialize list for dropdown selected values
  List<String?> relationselectedValues =
      []; // Initialize list for dropdown selected values

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    // Disable focus
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _focusNode.unfocus();
      }
    });

    // Initialize controllers based on addcount
    _initializeControllers();
  }

  void _initializeControllers() {
    birthdayControllers.clear();
    fullnameControllers.clear();
    genderselectedValues.clear();
    relationselectedValues.clear();

    for (int i = 0; i < addcount; i++) {
      birthdayControllers.add(TextEditingController());
      fullnameControllers.add(TextEditingController());
      genderselectedValues.add(null); // Initialize dropdown selected values
      relationselectedValues.add(null); // Initialize dropdown selected values
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    birthdayController.dispose();
    for (var controller in birthdayControllers) {
      controller.dispose();
    }
    for (var controller in fullnameControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<Null> _selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime currentdate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            hintColor: ColorManager.gray,
            colorScheme: ColorScheme.light(primary: ColorManager.mainColor),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1940, 1),
      lastDate:
          DateTime.utc(currentdate.year, currentdate.month, currentdate.day),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        String convertedDateTime =
            "${picked.year.toString()}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
        controller.value = TextEditingValue(text: convertedDateTime);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> siblingrelations = [
      AppLocalizations.of(context)!.spouse,
      AppLocalizations.of(context)!.children,
    ];
    List<String> genders = [
      AppLocalizations.of(context)!.male,
      AppLocalizations.of(context)!.female,
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MedicalAppBar(context),
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
              CustomTextField(
                focusNode: _focusNode,
                labeltext: AppLocalizations.of(context)!.dateOfBirthday,
                prefixicon: const Icon(Icons.cake),
                controller: birthdayController,
                inputType: TextInputType.none,
                suffix: IconButton(
                  onPressed: () async {
                    await _selectDate(context, birthdayController);
                  },
                  icon: Icon(Icons.calendar_today),
                ),
              ),
              SizedBox(
                height: ConfigSize.defaultSize! * 2,
              ),
              Center(
                child: DropDown(
                  onchanged: (String? value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  selectedValue: selectedValue,
                ),
              ),
              SizedBox(height: ConfigSize.defaultSize! * 2),
              Text(
                AppLocalizations.of(context)!.addyourmajority,
                style: TextStyle(
                  fontSize: ConfigSize.defaultSize! * 2,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: ConfigSize.defaultSize! * 2),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CustomTextField(
                        focusNode: _focusNode,
                        labeltext: AppLocalizations.of(context)!.dateOfBirthday,
                        prefixicon: const Icon(Icons.cake),
                        controller: birthdayControllers[index],
                        inputType: TextInputType.none,
                        suffix: IconButton(
                          onPressed: () async {
                            await _selectDate(
                                context, birthdayControllers[index]);
                          },
                          icon: Icon(Icons.calendar_today),
                        ),
                      ),
                      SizedBox(
                        height: ConfigSize.defaultSize! * 2,
                      ),
                      Center(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Text(
                              AppLocalizations.of(context)!.gender,
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            items: genders
                                .map((String item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            value: genderselectedValues[index],
                            onChanged: (value) {
                              setState(() {
                                genderselectedValues[index] = value;
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
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
                      ),
                      SizedBox(height: ConfigSize.defaultSize! * 2),
                      Center(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Text(
                              AppLocalizations.of(context)!.realtion,
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            items: siblingrelations
                                .map((String item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            value: relationselectedValues[index],
                            onChanged: (value) {
                              setState(() {
                                relationselectedValues[index] = value;
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
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
                      ),
                      SizedBox(height: ConfigSize.defaultSize! * 2),
                      CustomTextField(
                        labeltext: AppLocalizations.of(context)!.fullName,
                        prefixicon: const Icon(Icons.person),
                        controller: fullnameControllers[index],
                        inputType: TextInputType.name,
                      ),
                      SizedBox(height: ConfigSize.defaultSize! * 2),
                    ],
                  );
                },
                itemCount: addcount,
                shrinkWrap: true,
              ),
              MainButton(
                onTap: () {
                  setState(() {
                    addcount++;
                    _initializeControllers(); // Initialize controllers and values when addcount changes
                  });
                },
                title: AppLocalizations.of(context)!.add,
              ),
              Visibility(
                visible: addcount > 0,
                child: SizedBox(height: ConfigSize.defaultSize! * 2),
              ),
              Visibility(
                visible: addcount > 0,
                child: MainButton(
                  onTap: () {
                    setState(() {
                      if (addcount > 0) {
                        addcount--;
                        _initializeControllers(); // Initialize controllers and values when addcount changes
                      }
                    });
                  },
                  title: AppLocalizations.of(context)!.remove,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: ConfigSize.defaultSize! * 2),
                child: MainButton(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: MedicalForm3(),
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
    );
  }
}
