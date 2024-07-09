import 'package:flutter/material.dart';
import 'package:globaladvice_new/core/resource_manger/color_manager.dart';
import 'package:globaladvice_new/core/utils/config_size.dart';

class PropertyCheckbox extends StatelessWidget {
  PropertyCheckbox(
      {super.key, this.onChanged, required this.value, this.title});
  final Function(bool?)? onChanged;
  final bool value;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      value: value,
      onChanged: onChanged,
      activeColor: ColorManager.mainColor,
      checkColor: ColorManager.whiteColor,
      title: Text(
        textAlign: TextAlign.start,
        title!,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
