import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:globaladvice_new/core/resource_manger/color_manager.dart';
import 'package:globaladvice_new/features/home/presentation/component/medical_form/Widgets/Gender_Drop_Down_Widget.dart';
import 'package:globaladvice_new/features/home/presentation/component/medical_form/Widgets/medical_appbar.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'package:globaladvice_new/core/resource_manger/asset_path.dart';
import 'package:globaladvice_new/core/utils/config_size.dart';
import 'package:globaladvice_new/core/widgets/custom_text_field.dart';
import 'package:globaladvice_new/core/widgets/main_button.dart';

import 'package:globaladvice_new/features/home/presentation/component/medical_form/Pages/medical_form_3.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MedicalForm2 extends StatefulWidget {
  const MedicalForm2({super.key, required this.name, required this.phone});
  final String name;
  final String phone;

  @override
  State<MedicalForm2> createState() => _MedicalForm2State();
}

class _MedicalForm2State extends State<MedicalForm2> {
  TextEditingController emailController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  FocusNode _focusNode = FocusNode();

  String? selectedValue;

  DateTime selectedDate = DateTime.now();
  int addCount = 0;
  List<TextEditingController> birthdayControllers = [];
  List<TextEditingController> fullNameControllers = [];
  List<String?> genderSelectedValues =
      []; // Initialize list for dropdown selected values
  List<String?> relationSelectedValues =
      []; // Initialize list for dropdown selected values

  List<String>? genders = [];
  List<String>? names = [];
  List<String>? relations = [];
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    names!.add(widget.name);
    // Disable focus
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _focusNode.unfocus();
      }
    });

    // genders.clear();

    // Initialize controllers based on add count
    _initializeControllers();
  }

  void _initializeControllers() {
    birthdayControllers.clear();
    fullNameControllers.clear();
    genderSelectedValues.clear();
    relationSelectedValues.clear();

    for (int i = 0; i < addCount; i++) {
      birthdayControllers.add(TextEditingController());
      fullNameControllers.add(TextEditingController());
      genderSelectedValues.add(null); // Initialize dropdown selected values
      relationSelectedValues.add(null); // Initialize dropdown selected values
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    birthdayController.dispose();
    for (var controller in birthdayControllers) {
      controller.dispose();
    }
    for (var controller in fullNameControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  DateTime today = DateTime.now();

  Future<Null> _selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime currentdate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            hintColor: ColorManager.gray,
            colorScheme:
                const ColorScheme.light(primary: ColorManager.mainColor),
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
    List<String> gendersType = [
      AppLocalizations.of(context)!.male,
      AppLocalizations.of(context)!.female,
    ];
    List<int> new_ages;
    List<int> modify_ages_list() {
      new_ages = birthdayControllers
          .map((controller) {
            String text = controller.text;
            if (text.length >= 4) {
              int birthYear = int.tryParse(text.substring(0, 4)) ?? 0;
              return today.year - birthYear;
            }
            return 0; // Default value if text is invalid
          })
          .where((age) => age > 0)
          .toList();
      int main_age =
          today.year - int.parse(birthdayController.text.substring(0, 4));
      new_ages.insert(0, main_age);
      return new_ages;
    }

    String return_gender(String gender) {
      if (gender == 'ذكر') {
        return 'male';
      } else if (gender == 'أنثى') {
        return 'female';
      } else {
        return gender;
      }
    }

    List<String> modify_genders_list() {
      genders =
          genderSelectedValues.map((e) => return_gender(e.toString())).toList();
      genders!.insert(0, return_gender(selectedValue!));
      return genders!;
    }

    List<String> modify_names_list() {
      genders = fullNameControllers.map((e) => e.text.toString()).toList();
      genders!.insert(0, widget.name);
      return genders!;
    }

    List<String> modify_realtions_list() {
      relations = genderSelectedValues.map((e) => e.toString()).toList();
      relations!.insert(0, return_gender('self'));
      return relations!;
    }

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
                  icon: const Icon(Icons.calendar_today),
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
                    print(selectedValue);
                    print(genders);
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
                physics: const NeverScrollableScrollPhysics(),
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
                          icon: const Icon(Icons.calendar_today),
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
                            items: gendersType
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
                            value: genderSelectedValues[index],
                            onChanged: (value) {
                              setState(() {
                                genderSelectedValues[index] = value;
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
                            value: relationSelectedValues[index],
                            onChanged: (value) {
                              setState(() {
                                relationSelectedValues[index] = value;
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
                        controller: fullNameControllers[index],
                        inputType: TextInputType.name,
                      ),
                      SizedBox(height: ConfigSize.defaultSize! * 2),
                      index == addCount - 1
                          ? const SizedBox.shrink()
                          : const Divider(
                              thickness: 3, color: ColorManager.mainColor),
                      SizedBox(height: ConfigSize.defaultSize! * 2),
                    ],
                  );
                },
                itemCount: addCount,
                shrinkWrap: true,
              ),
              MainButton(
                onTap: () {
                  setState(() {
                    addCount++;
                    _initializeControllers(); // Initialize controllers and values when addcount changes
                  });
                },
                title: AppLocalizations.of(context)!.add,
              ),
              Visibility(
                visible: addCount > 0,
                child: SizedBox(height: ConfigSize.defaultSize! * 2),
              ),
              Visibility(
                visible: addCount > 0,
                child: MainButton(
                  onTap: () {
                    setState(() {
                      if (addCount > 0) {
                        addCount--;
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
                      screen: MedicalForm3(
                        phone: widget.phone,
                        gender: selectedValue!,
                        relations: modify_realtions_list(),
                        ages: modify_ages_list(),
                        names: modify_names_list(),
                        genders: modify_genders_list(),
                      ),
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
