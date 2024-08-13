import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:globaladvice_new/core/resource_manger/locale_keys.g.dart';

class MedicalPrices extends StatelessWidget {
  const MedicalPrices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringManager.medicalprices,
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
    );
  }
}
