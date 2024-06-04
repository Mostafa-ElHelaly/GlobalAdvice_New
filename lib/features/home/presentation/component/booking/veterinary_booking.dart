// import 'package:leash/core/resource_manger/asset_path.dart';
// import 'package:leash/core/resource_manger/color_manager.dart';
// import 'package:leash/core/resource_manger/locale_keys.g.dart';
// import 'package:leash/core/resource_manger/routs_manager.dart';
// import 'package:leash/core/utils/config_size.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:leash/features/home/presentation/home_screen.dart';
// import 'package:leash/features/matching/presentation/matching_screen.dart';
// import 'package:leash/main_screen.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
//
// import 'booking_card_details.dart';
//
// class Veterinary_Booking extends StatefulWidget {
//   const Veterinary_Booking({super.key});
//
//   @override
//   State<Veterinary_Booking> createState() => _Veterinary_BookingState();
// }
//
// class _Veterinary_BookingState extends State<Veterinary_Booking> {
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
//           'Veterinary Booking',
//           style: TextStyle(
//             fontWeight: FontWeight.w600,
//             fontSize: ConfigSize.defaultSize! * 2,
//           ),
//         ),
//       ),
//
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: ConfigSize.defaultSize! * 2,
//                     vertical: ConfigSize.defaultSize! * 4),
//                 child: Column(
//                   children: [
//                     InkWell(
//                       onTap: (){   PersistentNavBarNavigator.pushNewScreen(
//                         context,
//                         screen: const BookingCardDetails(),
//                         withNavBar: false,
//                         pageTransitionAnimation:
//                         PageTransitionAnimation.fade,
//                       );
//
//
//                         },
//                       child: Card(
//                         // semanticContainer: false,
//                         // borderOnForeground: false,
//                         shape: const ContinuousRectangleBorder(
//                             side: BorderSide.none, borderRadius: BorderRadius.zero),
//                         surfaceTintColor: Colors.white,
//                         shadowColor: Colors.white,
//                         color: Colors.white,
//                         child: Column(
//                           children: [
//                             Stack(
//                               alignment: Alignment.bottomLeft,
//                               children: [
//                                 ClipRRect(
//                                     borderRadius: BorderRadius.circular(
//                                         ConfigSize.defaultSize! * 2),
//                                     child: Image.asset(AssetsPath.VeterinaryDog)),
//                                 Padding(
//                                   padding:
//                                       EdgeInsets.all(ConfigSize.defaultSize! * 1),
//                                   child: Container(
//                                     width: ConfigSize.defaultSize! * 6,
//                                     decoration: const BoxDecoration(
//                                         color: Colors.black38,
//                                         borderRadius: BorderRadiusDirectional.all(
//                                             Radius.circular(50))),
//                                     child: Row(
//                                       children: [
//                                         SizedBox(
//                                           width: ConfigSize.defaultSize! * 0.5,
//                                         ),
//                                         const Icon(
//                                           Icons.star,
//                                           color: ColorManager.mainColor,
//                                         ),
//                                         const Text(
//                                           '4.5',
//                                           style: TextStyle(
//                                               color: ColorManager.whiteColor,
//                                               fontWeight: FontWeight.w500),
//                                         ),
//                                         SizedBox(
//                                           width: ConfigSize.defaultSize! * 0.5,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             SizedBox(
//                               height: ConfigSize.defaultSize! * 1,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   'Vet Master Clinic',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w800,
//                                       fontSize: ConfigSize.defaultSize! * 2),
//                                 ),
//                                 Text(
//                                   '600 EGP',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: ConfigSize.defaultSize! * 2.5,
//                                       color: ColorManager.mainColor),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: ConfigSize.defaultSize! * 1,
//                             ),
//                              Row(
//                               children: [
//                                  Icon(Icons.location_on_outlined ,color: ColorManager.mainColor,size: ConfigSize.defaultSize! * 3,),
//                                 SizedBox(
//                                   width: ConfigSize.defaultSize! * 1,
//                                 ),
//                                 const Text(
//                                   'Drayeb street, 10th of Rammadan Second, \n Al-Sharqia Governorate',
//                                 style: TextStyle(color: ColorManager.gray),
//                                 ),
//                               ],
//                             ),
//
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: ConfigSize.defaultSize!*2,),
//                     Card(
//                       // semanticContainer: false,
//                       // borderOnForeground: false,
//                       shape: const ContinuousRectangleBorder(
//                           side: BorderSide.none, borderRadius: BorderRadius.zero),
//                       surfaceTintColor: Colors.white,
//                       shadowColor: Colors.white,
//                       color: Colors.white,
//                       child: Column(
//                         children: [
//                           Stack(
//                             alignment: Alignment.bottomLeft,
//                             children: [
//                               ClipRRect(
//                                   borderRadius: BorderRadius.circular(
//                                       ConfigSize.defaultSize! * 2),
//                                   child: Image.asset(AssetsPath.VeterinaryDog)),
//                               Padding(
//                                 padding:
//                                 EdgeInsets.all(ConfigSize.defaultSize! * 1),
//                                 child: Container(
//                                   width: ConfigSize.defaultSize! * 6,
//                                   decoration: const BoxDecoration(
//                                       color: Colors.black38,
//                                       borderRadius: BorderRadiusDirectional.all(
//                                           Radius.circular(50))),
//                                   child: Row(
//                                     children: [
//                                       SizedBox(
//                                         width: ConfigSize.defaultSize! * 0.5,
//                                       ),
//                                       const Icon(
//                                         Icons.star,
//                                         color: ColorManager.mainColor,
//                                       ),
//                                       const Text(
//                                         '4.5',
//                                         style: TextStyle(
//                                             color: ColorManager.whiteColor,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                       SizedBox(
//                                         width: ConfigSize.defaultSize! * 0.5,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: ConfigSize.defaultSize! * 1,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Vet Master Clinic',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w800,
//                                     fontSize: ConfigSize.defaultSize! * 2),
//                               ),
//                               Text(
//                                 '600 EGP',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: ConfigSize.defaultSize! * 2.5,
//                                     color: ColorManager.mainColor),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: ConfigSize.defaultSize! * 1,
//                           ),
//                           Row(
//                             children: [
//                               Icon(Icons.location_on_outlined ,color: ColorManager.mainColor,size: ConfigSize.defaultSize! * 3,),
//                               SizedBox(
//                                 width: ConfigSize.defaultSize! * 1,
//                               ),
//                               const Text(
//                                 'Drayeb street, 10th of Rammadan Second, \n Al-Sharqia Governorate',
//                                 style: TextStyle(color: ColorManager.gray),
//                               ),
//                             ],
//                           ),
//
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: ConfigSize.defaultSize!*2,),
//
//                     Card(
//                       // semanticContainer: false,
//                       // borderOnForeground: false,
//                       shape: const ContinuousRectangleBorder(
//                           side: BorderSide.none, borderRadius: BorderRadius.zero),
//                       surfaceTintColor: Colors.white,
//                       shadowColor: Colors.white,
//                       color: Colors.white,
//                       child: Column(
//                         children: [
//                           Stack(
//                             alignment: Alignment.bottomLeft,
//                             children: [
//                               ClipRRect(
//                                   borderRadius: BorderRadius.circular(
//                                       ConfigSize.defaultSize! * 2),
//                                   child: Image.asset(AssetsPath.VeterinaryDog)),
//                               Padding(
//                                 padding:
//                                 EdgeInsets.all(ConfigSize.defaultSize! * 1),
//                                 child: Container(
//                                   width: ConfigSize.defaultSize! * 6,
//                                   decoration: const BoxDecoration(
//                                       color: Colors.black38,
//                                       borderRadius: BorderRadiusDirectional.all(
//                                           Radius.circular(50))),
//                                   child: Row(
//                                     children: [
//                                       SizedBox(
//                                         width: ConfigSize.defaultSize! * 0.5,
//                                       ),
//                                       const Icon(
//                                         Icons.star,
//                                         color: ColorManager.mainColor,
//                                       ),
//                                       const Text(
//                                         '4.5',
//                                         style: TextStyle(
//                                             color: ColorManager.whiteColor,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                       SizedBox(
//                                         width: ConfigSize.defaultSize! * 0.5,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: ConfigSize.defaultSize! * 1,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Vet Master Clinic',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w800,
//                                     fontSize: ConfigSize.defaultSize! * 2),
//                               ),
//                               Text(
//                                 '600 EGP',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: ConfigSize.defaultSize! * 2.5,
//                                     color: ColorManager.mainColor),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: ConfigSize.defaultSize! * 1,
//                           ),
//                           Row(
//                             children: [
//                               Icon(Icons.location_on_outlined ,color: ColorManager.mainColor,size: ConfigSize.defaultSize! * 3,),
//                               SizedBox(
//                                 width: ConfigSize.defaultSize! * 1,
//                               ),
//                               const Text(
//                                 'Drayeb street, 10th of Rammadan Second, \n Al-Sharqia Governorate',
//                                 style: TextStyle(color: ColorManager.gray),
//                               ),
//                             ],
//                           ),
//
//                         ],
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
