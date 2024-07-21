// import 'package:flutter/material.dart';
//
// class ConfigSize {
//
//   static double? screenHeight;
//   static double? screenWidth;
//   static double? defaultSize;
//   static Orientation? orientation;
//
//   void init( BuildContext context){
//     screenHeight = MediaQuery.of(context).size.height;
//     screenWidth = MediaQuery.of(context).size.width;
//     orientation = MediaQuery.of(context).orientation;
//     defaultSize = orientation == Orientation.landscape? screenHeight! *.024 :screenWidth! *.024 ;
//   }
// }

import 'package:flutter/material.dart';

class ConfigSize {
  static double? screenHeight =0.0;
  static double? screenWidth=0.0;
  static double? defaultSize=0.0;
  static Orientation? orientation = Orientation.portrait;

  void init(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    orientation = MediaQuery.of(context).orientation;
    defaultSize = orientation == Orientation.landscape
        ? screenHeight! * .024
        : screenWidth! * .024;
  }
}
