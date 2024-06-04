// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:givestarreviews/givestarreviews.dart';
// import 'package:leash/core/resource_manger/color_manager.dart';
// import 'package:leash/core/resource_manger/locale_keys.g.dart';
// import 'package:leash/core/resource_manger/routs_manager.dart';
// import 'package:leash/core/utils/config_size.dart';
// import 'package:leash/core/widgets/custom_text_field.dart';
// import 'package:leash/core/widgets/main_button.dart';
//
// class AddReview extends StatefulWidget {
//   const AddReview({super.key});
//
//   @override
//   State<AddReview> createState() => _AddReviewState();
// }
//
// TextEditingController textController = TextEditingController();
//
// class _AddReviewState extends State<AddReview> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadiusDirectional.circular(40)),
//         width: ConfigSize.screenWidth,
//         child: Padding(
//           padding:
//               EdgeInsets.symmetric(horizontal: ConfigSize.defaultSize! * 2),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: ConfigSize.defaultSize! * 4,
//               ),
//               Row(
//                 children: [
//                   Text(
//                     StringManager.addReview,
//                     style: TextStyle(
//                         fontWeight: FontWeight.w800,
//                         fontSize: ConfigSize.defaultSize! * 2),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: ConfigSize.defaultSize! * 2,
//               ),
//               StarRating(
//                   size: ConfigSize.defaultSize! * 5,
//                   inactiveStarColor: ColorManager.mainColor,
//                   activeStarColor: ColorManager.mainColor,
//                   onChanged: (rate) {}),
//               SizedBox(
//                 height: ConfigSize.defaultSize! * 4,
//               ),
//               CustomTextField(
//                 hint: 'whats your opinion about this clinic',
//                 controller: textController,
//                 inputType: TextInputType.text,
//               ),
//               Padding(
//                 padding:
//                     EdgeInsets.symmetric(vertical: ConfigSize.defaultSize! * 3),
//                 child: MainButton(
//                   onTap: () {},
//                   title: StringManager.addReview.tr(),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
