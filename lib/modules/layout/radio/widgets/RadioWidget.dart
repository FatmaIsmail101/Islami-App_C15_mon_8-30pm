import 'package:assignmenthb/modules/layout/radio/widgets/items/RadioItem.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';

class RadioWidget extends StatelessWidget {
  RadioWidget({super.key});

  List<String> radio = [
    "Radio Ibrahim Al-Akdar",
    "Radio Al-Qaria Yassen",
    "Radio Ahmed Al-trabulsi",
    "Radio Addokali Mohammad Alalim",
    "Radio Ahmed Al-trabulsi",
    "Radio Ahmed Al-trabulsi",
    "Radio Ahmed Al-trabulsi",
  ];
  List<String> img = [Assets.radioItembg, Assets.radioItembg1];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20),
      itemBuilder: (context, index) =>
          RadioItem(item: img[index % img.length], text: radio[index]),
      separatorBuilder: (context, index) => SizedBox(height: 20),
      itemCount: radio.length,
    );
  }
}
