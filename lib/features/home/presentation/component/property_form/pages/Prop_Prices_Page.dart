import 'package:flutter/material.dart';
import 'package:globaladvice_new/core/resource_manger/color_manager.dart';
import 'package:globaladvice_new/core/resource_manger/locale_keys.g.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:globaladvice_new/core/utils/config_size.dart';

import '../../../../../../core/widgets/main_button.dart';

class PropertyPrices extends StatefulWidget {
  const PropertyPrices(
      {super.key,
      required this.plan_name,
      required this.total_price,
      this.address,
      this.type,
      this.building_price,
      this.content_price,
      this.tenant_price,
      this.org_id,
      this.plan_id});
  final List<dynamic> plan_name;
  final List<dynamic> total_price;
  final String? address;
  final String? type;
  final int? building_price;
  final int? content_price;
  final int? tenant_price;
  final List<dynamic>? org_id;
  final List<dynamic>? plan_id;
  @override
  State<PropertyPrices> createState() => _PropertyPricesState();
}

class _PropertyPricesState extends State<PropertyPrices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.listofpropertyprice,
              style: TextStyle(
                  fontSize: ConfigSize.defaultSize! * 3,
                  fontWeight: FontWeight.bold),
            ),
            widget.total_price.isNotEmpty || widget.total_price != null
                ? ListView.builder(
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
                                    widget.plan_name[index].toString(),
                                    style: TextStyle(
                                        color: ColorManager.mainColor,
                                        fontSize: ConfigSize.defaultSize! * 2,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: ConfigSize.defaultSize! * 1,
                                  ),
                                  Text(
                                    widget.total_price[index]
                                        .toStringAsFixed(1)
                                        .toString(),
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
                                              onTap: () {
                                                // BlocProvider.of<
                                                //             CarPolicyBloc>(
                                                //         context)
                                                //     .add(CarPolicyblocEvent(
                                                //   isLicensed:
                                                //       widget.isLicensed,
                                                //   motorBrands:
                                                //       widget.motorBrands,
                                                //   motorDeductibles:
                                                //       widget.motorDeductibles,
                                                //   motorManufactureYear: widget
                                                //       .motorManufactureYear,
                                                //   organizationId: widget
                                                //       .organizationId[index],
                                                //   planId:
                                                //       widget.planId[index],
                                                //   price: widget.price,
                                                //   uID: prefs
                                                //       .getString("user_uid"),
                                                // ));
                                              },
                                              title:
                                                  AppLocalizations.of(context)!
                                                      .choosePolicy))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: widget.plan_name.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                  )
                : Center(
                    child: Text(
                    AppLocalizations.of(context)!.noOffersAvailable,
                    style: TextStyle(
                        fontSize: ConfigSize.defaultSize! * 2.5,
                        fontWeight: FontWeight.bold),
                  ))
          ],
        ),
      )),
    );
  }
}
