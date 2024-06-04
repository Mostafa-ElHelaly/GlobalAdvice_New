// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:givestarreviews/givestarreviews.dart';
// import 'package:leash/core/resource_manger/color_manager.dart';
// import 'package:leash/core/utils/config_size.dart';
// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'add_review.dart';
//
// class BookingCardDetails extends StatefulWidget {
//   const BookingCardDetails({super.key});
//
//   @override
//   State<BookingCardDetails> createState() => _BookingCardDetailsState();
// }
//
// class _BookingCardDetailsState extends State<BookingCardDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Stack(children: [
//                 CarouselSlider(
//                   options: CarouselOptions(
//                     height: ConfigSize.defaultSize! * 25,
//                     viewportFraction: 1,
//                     initialPage: 0,
//                     enableInfiniteScroll: true,
//                     reverse: false,
//                     autoPlay: false,
//                     autoPlayInterval: const Duration(seconds: 5),
//                     autoPlayAnimationDuration:
//                         const Duration(milliseconds: 800),
//                     autoPlayCurve: Curves.fastOutSlowIn,
//                     enlargeFactor: 0.3,
//                   ),
//                   items: [
//                     "assets/images/close-up-veterinarian-taking-care-dog.jpg",
//                     "assets/images/test2.jpg"
//                   ].map((i) {
//                     return Builder(
//                       builder: (BuildContext context) {
//                         return Container(
//                           width: ConfigSize.screenWidth!,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                                 image: AssetImage(i), fit: BoxFit.cover),
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         );
//                       },
//                     );
//                   }).toList(),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(ConfigSize.defaultSize! * 2),
//                   child: IconButton(
//                     style: const ButtonStyle(
//                         backgroundColor: MaterialStatePropertyAll(Colors.white),
//                     ),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: const Icon(
//                       Icons.arrow_back_ios_new,
//                       color: ColorManager.mainColor,
//                     ),
//                   ),
//                 ),
//               ]),
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: ConfigSize.defaultSize! * 2,
//                     vertical: ConfigSize.defaultSize! * 2),
//                 child: Column(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Vet Master Clinic',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w800,
//                                   fontSize: ConfigSize.defaultSize! * 2),
//                             ),
//                             Text(
//                               '600 EGP',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: ConfigSize.defaultSize! * 2.5,
//                                   color: ColorManager.mainColor),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: ConfigSize.defaultSize! * 1,
//                         ),
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.location_on_outlined,
//                               color: ColorManager.mainColor,
//                               size: ConfigSize.defaultSize! * 3,
//                             ),
//                             SizedBox(
//                               width: ConfigSize.defaultSize! * 1,
//                             ),
//                             const Text(
//                               'Drayeb street, 10th of Rammadan Second, \n Al-Sharqia Governorate',
//                               style: TextStyle(color: ColorManager.gray),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Padding(
//                               padding:
//                                   EdgeInsets.all(ConfigSize.defaultSize! * 1),
//                               child: Container(
//                                 width: ConfigSize.defaultSize! * 6,
//                                 decoration: const BoxDecoration(
//                                     color: Colors.black12,
//                                     borderRadius: BorderRadiusDirectional.all(
//                                         Radius.circular(50))),
//                                 child: Row(
//                                   children: [
//                                     SizedBox(
//                                       width: ConfigSize.defaultSize! * 0.5,
//                                     ),
//                                     const Icon(
//                                       Icons.star,
//                                       color: ColorManager.mainColor,
//                                     ),
//                                     SizedBox(
//                                       width: ConfigSize.defaultSize! * 0.2,
//                                     ),
//                                     const Text(
//                                       '4.5',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: ConfigSize.defaultSize! * 1,
//                             ),
//                             InkWell(
//                               onTap: () {},
//                               child: Text(
//                                 'View All Reviews',
//                                 style: TextStyle(
//                                     color: ColorManager.mainColor,
//                                     fontSize: ConfigSize.defaultSize! * 2,
//                                     fontWeight: FontWeight.w800),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: ConfigSize.defaultSize! * 2,
//                         ),
//                         Text(
//                           'Booking Time',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: ConfigSize.defaultSize! * 2),
//                         ),
//                         SizedBox(
//                           height: ConfigSize.defaultSize! * 1,
//                         ),
//                         TableCalendar(
//                           firstDay: DateTime.utc(2010, 10, 16),
//                           lastDay: DateTime.utc(2030, 3, 14),
//                           focusedDay: DateTime.now(),
//                           headerStyle: HeaderStyle(
//                             formatButtonVisible: false,
//                             titleCentered: true,
//                             rightChevronIcon: Container(
//                               width: ConfigSize.defaultSize! * 3.6,
//                               height: ConfigSize.defaultSize! * 3.6,
//                               decoration: BoxDecoration(
//                                   border:
//                                       Border.all(color: ColorManager.mainColor),
//                                   borderRadius:
//                                       const BorderRadiusDirectional.all(
//                                           Radius.circular(40))),
//                               child: const Icon(
//                                 Icons.arrow_forward_ios,
//                                 color: ColorManager.mainColor,
//                               ),
//                             ),
//                             leftChevronIcon: Container(
//                               width: ConfigSize.defaultSize! * 3.6,
//                               height: ConfigSize.defaultSize! * 3.6,
//                               decoration: BoxDecoration(
//                                   border:
//                                       Border.all(color: ColorManager.mainColor),
//                                   borderRadius:
//                                       const BorderRadiusDirectional.all(
//                                           Radius.circular(40))),
//                               child: const Icon(
//                                 Icons.arrow_back_ios_new,
//                                 color: ColorManager.mainColor,
//                               ),
//                             ),
//                           ),
//                           calendarStyle: CalendarStyle(
//                               todayDecoration: BoxDecoration(
//                                   color: ColorManager.mainColor,
//                                   borderRadius:
//                                       BorderRadiusDirectional.circular(60))),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Reviews',
//                               style: TextStyle(
//                                   fontSize: ConfigSize.defaultSize! * 2,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 showModalBottomSheet(
//                                     context: context,
//                                     builder: (builder){
//                                       return const AddReview();
//                                     }
//                                 );                              },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   color: ColorManager.secondaryColor,
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(
//                                     vertical: ConfigSize.defaultSize! * 1.5,
//                                     horizontal: ConfigSize.defaultSize! * 3,
//                                   ),
//                                   child: Text(
//                                     'Add Review',
//                                     style: TextStyle(
//                                       color: ColorManager.mainColor,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: ConfigSize.defaultSize! * 1.5,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const Text(
//                           'Mohamed Ahmed',
//                           style: TextStyle(fontWeight: FontWeight.w800),
//                         ),
//                         SizedBox(
//                           height: ConfigSize.defaultSize! * 0.5,
//                         ),
//                         StarRating(
//                             activeStarColor: ColorManager.mainColor,
//                             onChanged: (rate) {}),
//                         SizedBox(
//                           height: ConfigSize.defaultSize! * 0.5,
//                         ),
//                         const Text(
//                           'Very good service',
//                           style: TextStyle(color: ColorManager.gray),
//                         ),
//                         SizedBox(
//                           height: ConfigSize.defaultSize! * 2,
//                         ),
//                         const Text(
//                           'Aly Hussien',
//                           style: TextStyle(fontWeight: FontWeight.w800),
//                         ),
//                         SizedBox(
//                           height: ConfigSize.defaultSize! * 0.5,
//                         ),
//                         StarRating(
//                             activeStarColor: ColorManager.mainColor,
//                             onChanged: (rate) {}),
//                         SizedBox(
//                           height: ConfigSize.defaultSize! * 0.5,
//                         ),
//                         const Text(
//                           'Thank you for your good service',
//                           style: TextStyle(color: ColorManager.gray),
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
