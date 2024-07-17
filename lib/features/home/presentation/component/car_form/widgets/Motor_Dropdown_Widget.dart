import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:globaladvice_new/core/resource_manger/color_manager.dart';

import '../../../../../../core/utils/config_size.dart';

class CarDropdown extends StatefulWidget {
  CarDropdown(
      {super.key,
      this.selectedValue,
      required this.list,
      required this.onChanged,
      this.label});
  final String? selectedValue;
  final List<String> list;
  final Function(String?) onChanged;
  final String? label;
  @override
  State<CarDropdown> createState() => _CarDropdownState();
}

class _CarDropdownState extends State<CarDropdown> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            widget.label!,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: widget.list
              .map((String carBrand) => DropdownMenuItem<String>(
                    value: carBrand,
                    child: Text(
                      carBrand,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          value: widget.selectedValue,
          onChanged: widget.onChanged,
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
      ),
    );
  }
}
