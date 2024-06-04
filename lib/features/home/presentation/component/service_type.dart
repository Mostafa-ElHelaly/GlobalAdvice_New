// import 'package:leash/core/resource_manger/asset_path.dart';
// import 'package:leash/core/resource_manger/color_manager.dart';
// import 'package:leash/core/resource_manger/locale_keys.g.dart';
// import 'package:leash/core/utils/config_size.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:leash/features/home/presentation/component/booking/booking.dart';
// import 'package:leash/features/home/presentation/home_screen.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
//
// class ServiceType extends StatefulWidget {
//   const ServiceType({super.key});
//
//   @override
//   State<ServiceType> createState() => _ServiceTypeState();
// }
//
// class _ServiceTypeState extends State<ServiceType> {
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
//           'Service Type',
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
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             PersistentNavBarNavigator.pushNewScreen(
//                               context,
//                               screen: const HomeScreen(),
//                               withNavBar: true,
//                               pageTransitionAnimation: PageTransitionAnimation.fade,
//                             );
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 color: ColorManager.secondaryColor,
//                                 borderRadius:
//                                     BorderRadiusDirectional.circular(12)),
//                             width: ConfigSize.defaultSize! * 18,
//                             height: ConfigSize.defaultSize! * 20,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   AssetsPath.breeding,
//                                   scale: 1.5,
//                                 ),
//                                 SizedBox(
//                                   height: ConfigSize.defaultSize! * 1,
//                                 ),
//                                 Text(
//                                   StringManager.breeding.tr(),
//                                   style: const TextStyle(
//                                       color: ColorManager.mainColor,
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () { PersistentNavBarNavigator.pushNewScreen(
//                             context,
//                             screen: const HomeScreen(),
//                             withNavBar: true,
//                             pageTransitionAnimation: PageTransitionAnimation.fade,
//                           );},
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 color: ColorManager.secondaryColor,
//                                 borderRadius:
//                                     BorderRadiusDirectional.circular(12)),
//                             width: ConfigSize.defaultSize! * 18,
//                             height: ConfigSize.defaultSize! * 20,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   AssetsPath.playDate,
//                                   scale: 1.5,
//                                 ),
//                                 SizedBox(
//                                   height: ConfigSize.defaultSize! * 1,
//                                 ),
//                                 Text(
//                                   StringManager.playDate.tr(),
//                                   style: const TextStyle(
//                                       color: ColorManager.mainColor,
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: ConfigSize.defaultSize! * 2,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         InkWell(
//                           onTap: () { PersistentNavBarNavigator.pushNewScreen(
//                             context,
//                             screen: const HomeScreen(),
//                             withNavBar: true,
//                             pageTransitionAnimation: PageTransitionAnimation.fade,
//                           );},
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 color: ColorManager.secondaryColor,
//                                 borderRadius:
//                                     BorderRadiusDirectional.circular(12)),
//                             width: ConfigSize.defaultSize! * 18,
//                             height: ConfigSize.defaultSize! * 20,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   AssetsPath.adoption,
//                                   scale: 1.5,
//                                 ),
//                                 SizedBox(
//                                   height: ConfigSize.defaultSize! * 1,
//                                 ),
//                                 Text(
//                                   StringManager.adoption.tr(),
//                                   style: const TextStyle(
//                                       color: ColorManager.mainColor,
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () { PersistentNavBarNavigator.pushNewScreen(
//                             context,
//                             screen: const Booking(),
//                             withNavBar: true,
//                             pageTransitionAnimation: PageTransitionAnimation.fade,
//                           );},
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 color: ColorManager.secondaryColor,
//                                 borderRadius:
//                                     BorderRadiusDirectional.circular(12)),
//                             width: ConfigSize.defaultSize! * 18,
//                             height: ConfigSize.defaultSize! * 20,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   AssetsPath.booking,
//                                   scale: 1.5,
//                                 ),
//                                 SizedBox(
//                                   height: ConfigSize.defaultSize! * 1,
//                                 ),
//                                 Text(
//                                   StringManager.booking.tr(),
//                                   style: const TextStyle(
//                                       color: ColorManager.mainColor,
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: ConfigSize.defaultSize! * 2,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         InkWell(
//                           onTap: () { PersistentNavBarNavigator.pushNewScreen(
//                             context,
//                             screen: const HomeScreen(),
//                             withNavBar: true,
//                             pageTransitionAnimation: PageTransitionAnimation.fade,
//                           );},
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 color: ColorManager.secondaryColor,
//                                 borderRadius:
//                                     BorderRadiusDirectional.circular(12)),
//                             width: ConfigSize.defaultSize! * 18,
//                             height: ConfigSize.defaultSize! * 20,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   AssetsPath.howto,
//                                   scale: 1.5,
//                                 ),
//                                 SizedBox(
//                                   height: ConfigSize.defaultSize! * 1,
//                                 ),
//                                 Text(
//                                   StringManager.howto.tr(),
//                                   style: const TextStyle(
//                                       color: ColorManager.mainColor,
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () { PersistentNavBarNavigator.pushNewScreen(
//                             context,
//                             screen: const HomeScreen(),
//                             withNavBar: true,
//                             pageTransitionAnimation: PageTransitionAnimation.fade,
//                           );},
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 color: ColorManager.secondaryColor,
//                                 borderRadius:
//                                     BorderRadiusDirectional.circular(12)),
//                             width: ConfigSize.defaultSize! * 18,
//                             height: ConfigSize.defaultSize! * 20,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   AssetsPath.help,
//                                   scale: 1.5,
//                                 ),
//                                 SizedBox(
//                                   height: ConfigSize.defaultSize! * 1,
//                                 ),
//                                 Text(
//                                   StringManager.help.tr(),
//                                   style: const TextStyle(
//                                       color: ColorManager.mainColor,
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
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
