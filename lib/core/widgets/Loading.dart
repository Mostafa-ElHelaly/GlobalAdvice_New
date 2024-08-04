import 'package:flutter/material.dart';
import 'package:globaladvice_new/core/resource_manger/color_manager.dart';

showloading(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("PLease Wait"),
          content: Container(
              color: Colors.transparent,
              height: 50,
              child: Center(
                  child: CircularProgressIndicator(
                color: ColorManager.mainColor,
              ))),
        );
      });
}
