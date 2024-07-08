import 'package:flutter/material.dart';
import 'package:globaladvice_new/core/resource_manger/locale_keys.g.dart';

class CarPrices extends StatelessWidget {
  const CarPrices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringManager.carprices),
        centerTitle: true,
      ),
    );
  }
}
