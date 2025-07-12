import 'package:assignmenthb/core/theme/color_palette.dart';
import 'package:assignmenthb/models/suramodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/constants/assets.dart';

class QuranDetailsView extends StatefulWidget {
  const QuranDetailsView({super.key});

  @override
  State<QuranDetailsView> createState() => _QuranDetailsViewState();
}

class _QuranDetailsViewState extends State<QuranDetailsView> {
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
                    itemBuilder: (context, index) => Text(
                      "[${index + 1}] ${verses[index]}",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: theme.primaryColor,
                      ),
                    ),
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
    verses = content.split("\n");

    setState(() {});
    print(content);
  }
}
