import 'package:flutter/material.dart';
import 'package:globaladvice_new/core/resource_manger/color_manager.dart';

void showLoading(BuildContext context) {
  // Show the dialog
  final dialog = showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Please Wait"),
        content: Container(
          color: Colors.transparent,
          height: 50,
          child: Center(
            child: CircularProgressIndicator(
              color:
                  Colors.blue, // Replace with ColorManager.mainColor if needed
            ),
          ),
        ),
      );
    },
    barrierDismissible:
        false, // Prevents closing the dialog by tapping outside of it
  );

  // Dismiss the dialog after the specified duration
  Future.delayed(Duration(seconds: 5), () {
    Navigator.of(context, rootNavigator: true)
        .pop(); // Use rootNavigator to ensure it's closed
  });
}
