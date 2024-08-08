import 'package:flutter/material.dart';
import 'package:globaladvice_new/core/resource_manger/color_manager.dart';
import 'package:globaladvice_new/core/resource_manger/locale_keys.g.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:globaladvice_new/core/utils/config_size.dart';
import 'package:globaladvice_new/core/utils/translation_provider.dart';
import 'package:globaladvice_new/core/widgets/main_button.dart';
import 'package:globaladvice_new/features/home/data/data_source/remotly_data_resource.dart';
import 'package:globaladvice_new/features/home/data/model/car_insurance_request_model.dart';
import 'package:provider/provider.dart';

import '../../../../data/model/car_request_response_model.dart';

class CarPrices extends StatelessWidget {
  const CarPrices({
    super.key,
    required this.percent,
    required this.PlanName,
    required this.price,
  });
  final int percent;
  final int price;
  final String PlanName;

  @override
  Widget build(BuildContext context) {
    return Consumer<TranslationProvider>(
      builder: (context, getperices, child) {
        return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.listofmotorprice,
                  style: TextStyle(
                      fontSize: ConfigSize.defaultSize! * 3,
                      fontWeight: FontWeight.bold),
                ),
                ListView.builder(
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius:
                          BorderRadius.circular(ConfigSize.defaultSize! * 2),
                      child: Padding(
                        padding: EdgeInsets.all(ConfigSize.defaultSize! * 2),
                        child: Card(
                          color: ColorManager.whiteColor,
                          child: Padding(
                            padding:
                                EdgeInsets.all(ConfigSize.defaultSize! * 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  PlanName,
                                  style: TextStyle(
                                      color: ColorManager.mainColor,
                                      fontSize: ConfigSize.defaultSize! * 2,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: ConfigSize.defaultSize! * 1,
                                ),
                                Text(
                                  (percent * price).toString(),
                                  style: TextStyle(
                                      color: ColorManager.kSecondryGreenLight,
                                      fontSize: ConfigSize.defaultSize! * 2,
                                      fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        height: ConfigSize.defaultSize! * 4,
                                        width: ConfigSize.defaultSize! * 15,
                                        child: MainButton(
                                            onTap: () {},
                                            title: 'Choose Policy'))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 1,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                )
              ],
            ),
          )),
        );
      },
    );
  }
}
