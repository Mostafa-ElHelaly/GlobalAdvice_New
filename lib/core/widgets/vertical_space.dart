import 'package:flutter/material.dart';
import 'package:globaladvice_new/core/utils/config_size.dart';

class VerticalSpace extends StatelessWidget {
  const VerticalSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ConfigSize.defaultSize! * 1,
    );
  }
}
