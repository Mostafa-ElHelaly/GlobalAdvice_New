import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/config_size.dart';

class DropDown extends StatelessWidget {
  DropDown({super.key, this.onchanged, this.selectedValue});
  final Function(String?)? onchanged;
  final String? selectedValue;
  final List<String> items = [
    'Male',
    'Female',
  ];

  bool isVisible = true;
  bool isVisible1 = true;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          'Gander',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: items
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: onchanged,
        buttonStyleData: ButtonStyleData(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300, width: 1),
          ),
          padding:
              EdgeInsets.symmetric(horizontal: ConfigSize.defaultSize! * 1.6),
          height: ConfigSize.defaultSize! * 5.5,
          width: ConfigSize.screenWidth,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
      ),
    );
  }
}
