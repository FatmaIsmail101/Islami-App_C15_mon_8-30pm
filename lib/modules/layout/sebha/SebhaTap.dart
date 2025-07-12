import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../../../core/constants/assets.dart';

class SebhaTap extends StatefulWidget {
  const SebhaTap({super.key});

  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "لا إله إلا الله",
    "الله أكبر",
    "استغفر الله",
    "لا حول ولا قوة إلا بالله",
  ];

  List<String> quran = [
    "قُلْ يَا أَيُّهَا الْكَافِرُونَ",
    "لَا أَعْبُدُ مَا تَعْبُدُون",
    "وَلَا أَنْتُمْ عَابِدُونَ مَا أَعْبُدُ ",
    "وَلَا أَنَا عَابِدٌ مَا عَبَدْتُم",
    "وَلَا أَنْتُمْ عَابِدُونَ مَا أَعْبُدُ",
    "لَكُمْ دِينُكُمْ وَلِيَ دِينِ ",
    "قُلْ هُوَ اللَّهُ أَحَدٌ ",
    "اللَّهُ الصَّمَد",
    "لَمْ يَلِدْ وَلَمْ يُولَد",
    "وَلَمْ يَكُنْ لَهُ كُفُوًا أَحَد",
  ];

  int index = 0;
  int azkarIndex = 0;
  int quranIndex = 0;
  int counter = 0;
  double angle = 0;

  void onSebhaTap() {
    setState(() {
      counter++;
      angle += math.pi / 15;
      if (counter >= 33) {
        counter = 0;
        azkarIndex = (azkarIndex + 1) % azkar.length;
        quranIndex = (quranIndex + 1) % quran.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.SebhaBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        spacing: 10,
        children: [
          Image(image: AssetImage(Assets.HeaderLogo)),
          Text(quran[quranIndex], style: theme.textTheme.headlineLarge),

          Bounceable(
            onTap: onSebhaTap,
            child: Stack(
              alignment: Alignment.center,

              children: [
                Transform.rotate(
                  angle: angle,
                  alignment: Alignment(0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 390,

                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Assets.SebhaBody),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 190,
                  height: 390,
                  alignment: Alignment.center,
                  child: Column(
                    spacing: 20,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        softWrap: true,

                        azkar[azkarIndex],
                        style: theme.textTheme.headlineLarge,
                      ),
                      Text("$counter", style: theme.textTheme.headlineLarge),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
