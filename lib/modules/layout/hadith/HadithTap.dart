
import 'package:assignmenthb/modules/layout/hadith/widget/HadithWidget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


import '../../../core/constants/assets.dart';

class HadithTap extends StatefulWidget {
  const HadithTap({super.key});

  @override
  State<HadithTap> createState() => _HadithTapState();
}

class _HadithTapState extends State<HadithTap> {
  

  @override
  Widget build(BuildContext context) {


    final height = MediaQuery.of(context).size;
    final width = MediaQuery.of(context).size;

    return Container(
      height: height.height,
      width: width.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.HadithBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children:[ Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(Assets.HeaderLogo), fit: BoxFit.cover),
            CarouselSlider(
              options: CarouselOptions(height: 499.0),
              items: List.generate(50, (index)=>index+1).map((index) {
                return HadithWidget(index: index,);
              }).toList(),
            )
          ],
        ),
        ] ),
    );
  }

}
