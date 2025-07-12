import 'package:assignmenthb/core/theme/color_palette.dart';
import 'package:assignmenthb/models/suramodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../../../../core/constants/assets.dart';

class QuranDetailsView1 extends StatefulWidget {
  const QuranDetailsView1({super.key});

  @override
  State<QuranDetailsView1> createState() => _QuranDetailsViewState();
}

class _QuranDetailsViewState extends State<QuranDetailsView1> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final data = ModalRoute.of(context)?.settings.arguments as SuraData;
    if (verses.isEmpty) loadSuraDataFromAssets(data.id.toString());
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          data.suraNameEn,
          style: theme.textTheme.headlineSmall!.copyWith(
            color: ColorPalette.primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image(image: AssetImage(Assets.QuranDetailsBg), fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.only(right: 22.0, left: 22, bottom: 70),
            child: Column(
              spacing: 30,
              children: [
                Text(
                  data.suraNameAR,
                  style: theme.textTheme.headlineSmall!.copyWith(
                    color: ColorPalette.primaryColor,
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      final isSelected = selectedIndex == index;
                      return Bounceable(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? theme.primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: theme.primaryColor),
                          ),
                          child: Text(
                            "[${index + 1}] ${verses[index]}",
                            textAlign: TextAlign.center,
                            style: theme.textTheme.titleLarge!.copyWith(
                              color: isSelected
                                  ? Colors.black
                                  : theme.primaryColor,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 20),
                    itemCount: verses.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<String> verses = [];

  Future<void> loadSuraDataFromAssets(String index) async {
    String content = await rootBundle.loadString(
      "assets/files/Suras/$index.txt",
    );
    verses = content
        .split("\n")
        .where((line) => line.trim().isNotEmpty)
        .toList();

    setState(() {});
    print(content);
  }
}
