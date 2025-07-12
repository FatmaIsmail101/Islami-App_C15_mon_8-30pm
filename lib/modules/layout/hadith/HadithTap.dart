import 'package:assignmenthb/models/hadithDataModel.dart';
import 'package:assignmenthb/modules/layout/hadith/widget/HadithWidget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    if (hadithDataList.isEmpty) loadhadithContent(index);

    final height = MediaQuery.of(context).size;
    final width = MediaQuery.of(context).size;
    final theme = Theme.of(context);
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
        children: [
          Image(image: AssetImage(Assets.HeaderLogo), fit: BoxFit.cover),
          CarouselSlider(
            items: hadithDataList.map((e) {
              return HadithWidget(hadithDataModel: e);
            }).toList(),
            options: CarouselOptions(
              height: height.height * .4,
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

  void loadhadithContent(int index) async {
    String content = await rootBundle.loadString(
      "assets/files/Hadeeth/h$index.txt",
    );
    List<String> hadith = [];

    for (var element in hadith) {
      String singleHadith = element.trim();
      int indexOfTitle = singleHadith.indexOf("\n");
      String HadithTitle = singleHadith.substring(0, indexOfTitle);
      String hadithContent = singleHadith.substring(indexOfTitle + 1);
      HadithDataModel hadithDataModel = HadithDataModel(
        title: HadithTitle,
        content: hadithContent,
      );

      setState(() {
        hadithDataList.add(hadithDataModel);
      });
    }
  }
}
