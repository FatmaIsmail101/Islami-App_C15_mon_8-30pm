import 'package:assignmenthb/models/hadithDataModel.dart';
import 'package:assignmenthb/modules/layout/hadith/widget/HadithWidget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/constants/assets.dart';

class HadithTap extends StatefulWidget {
  const HadithTap({super.key});

  @override
  State<HadithTap> createState() => _HadithTapState();
}

class _HadithTapState extends State<HadithTap> {
  int index = 1;

  @override
  void initState() {
    super.initState();
    if (hadithDataList.isEmpty) loadhadithContent();
  }

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage(Assets.HeaderLogo), fit: BoxFit.cover),
          CarouselSlider(
            items: hadithDataList.map((e) {
              return HadithWidget(hadithDataModel: e);
            }).toList(),
            options: CarouselOptions(
              height: height.height * .65,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }

  List<HadithDataModel> hadithDataList = [];

  void loadhadithContent() async {
    List<HadithDataModel> loadedAhadith = [];

    for (int i = 1; i <= 50; i++) {
      try {
        String content = await rootBundle.loadString(
          "assets/files/Hadeeth/h$i.txt",
        );

        List<String> lines = content.trim().split("\n");
        if (lines.isEmpty) continue;

        String hadithTitle = lines.first.trim();
        String hadithContent = lines.sublist(1).join("\n").trim();

        HadithDataModel hadithDataModel = HadithDataModel(
          title: hadithTitle,
          content: hadithContent,
        );

        loadedAhadith.add(hadithDataModel);
      } catch (e) {
        print("خطأ في تحميل h$i.txt: $e");
      }
    }

    setState(() {
      hadithDataList = loadedAhadith;
    });
  }
}
