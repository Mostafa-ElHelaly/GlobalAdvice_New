// import 'package:leash/core/resource_manger/asset_path.dart';
// import 'package:leash/core/resource_manger/color_manager.dart';
// import 'package:leash/core/resource_manger/locale_keys.g.dart';
// import 'package:leash/core/utils/config_size.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:leash/features/home/presentation/component/booking/veterinary_booking.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
//
// class Booking extends StatefulWidget {
//   const Booking({super.key});
//
//   @override
//   State<Booking> createState() => _BookingState();
// }
//
// class _BookingState extends State<Booking> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back_ios_new,
//             color: ColorManager.mainColor,
//           ),
//         ),
//         centerTitle: true,
//         title: Text(
//           'Booking',
//           style: TextStyle(
//             fontWeight: FontWeight.w600,
//             fontSize: ConfigSize.defaultSize! * 2,
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal: ConfigSize.defaultSize! * 2,
//                   vertical: ConfigSize.defaultSize! * 4),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           PersistentNavBarNavigator.pushNewScreen(
//                             context,
//                             screen: const Veterinary_Booking(),
//                             withNavBar: true,
//                             pageTransitionAnimation:
//                                 PageTransitionAnimation.fade,
//                           );
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: ColorManager.secondaryColor,
//                               borderRadius:
//                                   BorderRadiusDirectional.circular(12)),
//                           width: ConfigSize.defaultSize! * 18,
//                           height: ConfigSize.defaultSize! * 20,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 AssetsPath.veterinary,
//                                 scale: 1.5,
//                               ),
//                               SizedBox(
//                                 height: ConfigSize.defaultSize! * 1,
//                               ),
//                               Text(
//                                 StringManager.veterinary.tr(),
//                                 textAlign: TextAlign.center,
//                                 style: const TextStyle(
//                                     color: ColorManager.mainColor,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           PersistentNavBarNavigator.pushNewScreen(
//                             context,
//                             screen: const Veterinary_Booking(),
//                             withNavBar: true,
//                             pageTransitionAnimation:
//                                 PageTransitionAnimation.fade,
//                           );
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: ColorManager.secondaryColor,
//                               borderRadius:
//                                   BorderRadiusDirectional.circular(12)),
//                           width: ConfigSize.defaultSize! * 18,
//                           height: ConfigSize.defaultSize! * 20,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 AssetsPath.salons,
//                                 scale: 1.5,
//                               ),
//                               SizedBox(
//                                 height: ConfigSize.defaultSize! * 1,
//                               ),
//                               Text(
//                                 StringManager.salons.tr(),
//                                 textAlign: TextAlign.center,
//                                 style: const TextStyle(
//                                     color: ColorManager.mainColor,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: ConfigSize.defaultSize! * 2,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           PersistentNavBarNavigator.pushNewScreen(
//                             context,
//                             screen: const Veterinary_Booking(),
//                             withNavBar: true,
//                             pageTransitionAnimation:
//                                 PageTransitionAnimation.fade,
//                           );
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: ColorManager.secondaryColor,
//                               borderRadius:
//                                   BorderRadiusDirectional.circular(12)),
//                           width: ConfigSize.defaultSize! * 18,
//                           height: ConfigSize.defaultSize! * 20,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 AssetsPath.training,
//                                 scale: 1.5,
//                               ),
//                               SizedBox(
//                                 height: ConfigSize.defaultSize! * 1,
//                               ),
//                               Text(
//                                 StringManager.trainingCenters.tr(),
//                                 textAlign: TextAlign.center,
//                                 style: const TextStyle(
//                                     color: ColorManager.mainColor,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           // PersistentNavBarNavigator.pushNewScreen(
//                           //   context,
//                           //   screen: const Veterinary_Booking(),
//                           //   withNavBar: true,
//                           //   pageTransitionAnimation:
//                           //       PageTransitionAnimation.fade,
//                           // );
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: ColorManager.secondaryColor,
//                               borderRadius:
//                                   BorderRadiusDirectional.circular(12)),
//                           width: ConfigSize.defaultSize! * 18,
//                           height: ConfigSize.defaultSize! * 20,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 AssetsPath.help,
//                                 scale: 1.5,
//                               ),
//                               SizedBox(
//                                 height: ConfigSize.defaultSize! * 1,
//                               ),
//                               Text(
//                                 StringManager.help.tr(),
//                                 textAlign: TextAlign.center,
//                                 style: const TextStyle(
//                                     color: ColorManager.mainColor,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
