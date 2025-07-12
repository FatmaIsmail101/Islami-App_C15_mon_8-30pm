import 'package:assignmenthb/modules/layout/radio/widgets/items/RecitersItem.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';

class RecitersWidget extends StatelessWidget {
  RecitersWidget({super.key});

  List<String> reciters = [
    "Ibrahim Al-Akdar",
    "Akram Alalaqmi",
    "Majed Al-Enezi",
    "Malik shaibat Alhamed",
    "Abdel Baset Abdel Sammad",
    "Mohamed Sedek Elmenshawy",
    "Abdel Baset Abdel Sammad",
  ];
  List<String> img = [Assets.radioItembg, Assets.radioItembg1];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20),
      itemBuilder: (context, index) =>
          RecitersItem(text: reciters[index], item: img[index % img.length]),
      separatorBuilder: (context, index) => SizedBox(height: 20),
      itemCount: reciters.length,
    );
  }
}
