import 'dart:ui';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:globaladvice_new/core/resource_manger/routs_manager.dart';
import 'package:globaladvice_new/core/widgets/snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../core/resource_manger/color_manager.dart';
import '../../../../../../core/utils/config_size.dart';
import '../../../../../../core/widgets/main_button.dart';
import '../../../manager/health_policy/health_policy_bloc.dart';
import '../../../manager/health_policy/health_policy_event.dart';
import '../../../manager/health_policy/health_policy_state.dart';
import '../../life_form/widgets/Back_Button.dart';

class MedicalPrices extends StatefulWidget {
  const MedicalPrices({
    super.key,
    required this.total_price,
    required this.plan_name,
    required this.persons,
    required this.health_limit,
    this.genders,
    required this.health_penefits,
    required this.data_length,
    required this.org_id,
    required this.plan_id,
    this.names,
    this.relations,
    this.ages,
    required this.amounts_length,
  });
  final List<dynamic> org_id;
  final List<dynamic> plan_id;
  final List<dynamic> total_price;
  final List<dynamic> plan_name;
  final List<dynamic> persons;
  final List<dynamic> health_limit;
  final List<dynamic> health_penefits;
  final List<String>? genders;
  final List<String>? names;
  final List<String>? relations;
  final List<int>? ages;
  final int data_length;
  final int amounts_length;

  @override
  State<MedicalPrices> createState() => _MedicalPricesState();
}

class _MedicalPricesState extends State<MedicalPrices> {
  TextStyle label_style = TextStyle(
    fontSize: ConfigSize.defaultSize! * 2,
    fontWeight: FontWeight.bold,
    color: ColorManager.gray,
  );
  @override
  void initState() {
    print(widget.genders);
    _initSharedPreferences();
    super.initState();
  }

  late SharedPreferences prefs;

  Future<void> _initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(
        () {}); // Ensure the state is updated after SharedPreferences is initialized
  }

  @override
  Widget build(BuildContext context) {
    var localetype = Localizations.localeOf(context).languageCode;
    List<dynamic> prices = [];

    List<dynamic> get_names(int index) {
      return widget.persons[index].map((e) => e['name']).toList();
    }

    List<dynamic> get_amount(int index) {
      return widget.persons[index].map((e) => e['amount']).toList();
    }

    List<dynamic> get_health_limits(int index) {
      return widget.health_limit[index]
          .map((e) => localetype == 'ar' ? e['name_alt'] : e['name'])
          .toList();
    }

    List<dynamic> get_health_benefits_names(int index) {
      return widget.health_penefits[index]
          .map((e) => localetype == 'ar' ? e['name_alt'] : e['name'])
          .toList();
    }

    List<dynamic> get_health_benefits_desc(int index) {
      return widget.health_penefits[index]
          .map((e) => localetype == 'ar' ? e['desc_alt'] : e['desc'])
          .toList();
    }

    List<dynamic> modify_prices_list(int index) {
      prices = widget.persons[index].map((e) => e['amount']).toList();
      return prices;
    }

    return BlocListener<HealthPolicyBloc, HealthPolicyblocState>(
        listener: (context, state) {
          if (state is HealthPolicySuccessState) {
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
          } else if (state is HealthPolicyRequestErrorState) {
            errorSnackBar(context, state.errorMessage);
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back_ios_new_rounded),
                      ),
                      Text(
                        AppLocalizations.of(context)!.listofhealthprice,
                        style: TextStyle(
                          fontSize: localetype == 'ar'
                              ? ConfigSize.defaultSize! * 3
                              : ConfigSize.defaultSize! * 2.25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  widget.total_price.isNotEmpty
                      ? ListView.builder(
                          physics: ClampingScrollPhysics(),
                          itemCount: widget.data_length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(
                                ConfigSize.defaultSize! * 2,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(
                                  ConfigSize.defaultSize! * 2,
                                ),
                                child: Card(
                                  color: ColorManager.whiteColor,
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                      ConfigSize.defaultSize! * 2,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.plan_name[index].toString(),
                                          style: TextStyle(
                                            color: ColorManager.mainColor,
                                            fontSize:
                                                ConfigSize.defaultSize! * 3,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: ConfigSize.defaultSize! * 1,
                                        ),
                                        Text(
                                          widget.total_price[index].toString() +
                                              ' ' +
                                              AppLocalizations.of(context)!
                                                  .egy_year,
                                          style: TextStyle(
                                            color: ColorManager
                                                .kSecondryGreenLight,
                                            fontSize:
                                                ConfigSize.defaultSize! * 2,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: ConfigSize.defaultSize! * 1,
                                        ),
                                        ListView.builder(
                                          itemCount: get_names(index).length,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index2) {
                                            return Column(
                                              crossAxisAlignment:
                                                  localetype == 'ar'
                                                      ? CrossAxisAlignment.start
                                                      : CrossAxisAlignment.end,
                                              children: [
                                                ListTile(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                    vertical: ConfigSize
                                                            .defaultSize! *
                                                        1,
                                                  ),
                                                  subtitle: Text(
                                                    get_amount(index)[index2]
                                                            .toString() +
                                                        ' ' +
                                                        AppLocalizations.of(
                                                                context)!
                                                            .egy_year,
                                                    style: TextStyle(
                                                      color: ColorManager
                                                          .kSecondryGreenLight,
                                                    ),
                                                  ),
                                                  title: Text(
                                                      get_names(index)[index2]),
                                                  leading: Icon(
                                                    size: ConfigSize
                                                            .defaultSize! *
                                                        3,
                                                    widget.genders![index] ==
                                                            'male'
                                                        ? Icons.person
                                                        : Icons
                                                            .person_3_outlined,
                                                    color: ColorManager
                                                        .kSecondryGreenLight,
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          height: ConfigSize.defaultSize! * 1,
                                        ),
                                        Text(
                                          AppLocalizations.of(context)!
                                              .annuallimit,
                                          style: label_style,
                                        ),
                                        ListTile(
                                          leading: Icon(
                                            Icons.safety_check_outlined,
                                            color: ColorManager.secondaryColor,
                                          ),
                                          title: Text(
                                            get_health_limits(index).join(', '),
                                          ),
                                        ),
                                        SizedBox(
                                          height: ConfigSize.defaultSize! * 1,
                                        ),
                                        Text(
                                          AppLocalizations.of(context)!
                                              .healthbenefits,
                                          style: label_style,
                                        ),
                                        SizedBox(
                                          height: ConfigSize.defaultSize! * 1,
                                        ),
                                        ListView.builder(
                                          itemCount:
                                              get_health_benefits_names(index)
                                                  .length,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index3) {
                                            return ListTile(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                vertical:
                                                    ConfigSize.defaultSize! * 1,
                                              ),
                                              subtitle: Text(
                                                get_health_benefits_desc(
                                                    index)[index3],
                                              ),
                                              title: Text(
                                                get_health_benefits_names(
                                                    index)[index3],
                                                style: TextStyle(
                                                  fontSize:
                                                      ConfigSize.defaultSize! *
                                                          1.5,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              leading: Icon(
                                                Icons
                                                    .health_and_safety_outlined,
                                                color: ColorManager
                                                    .kSecondryGreenLight,
                                              ),
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          height: ConfigSize.defaultSize! * 1,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              height:
                                                  ConfigSize.defaultSize! * 4,
                                              width:
                                                  ConfigSize.defaultSize! * 15,
                                              child: MainButton(
                                                onTap: () {
                                                  ;
                                                  BlocProvider.of<
                                                              HealthPolicyBloc>(
                                                          context)
                                                      .add(
                                                          HealthPolicyblocEvent(
                                                    gender: widget.genders,
                                                    name: widget.names,
                                                    age: widget.ages,
                                                    planId:
                                                        widget.plan_id[index],
                                                    organizationId:
                                                        widget.org_id[index],
                                                    price: modify_prices_list(
                                                        index),
                                                    relations: widget.relations,
                                                    uID: prefs
                                                        .getString("user_uid"),
                                                  ));
                                                },
                                                title: AppLocalizations.of(
                                                        context)!
                                                    .choosePolicy,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Text(
                            AppLocalizations.of(context)!.noOffersAvailable,
                            style: TextStyle(
                              fontSize: ConfigSize.defaultSize! * 2.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ));
  }
}
