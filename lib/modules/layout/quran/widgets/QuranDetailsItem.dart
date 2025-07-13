import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class QuranDetailsItem extends StatefulWidget {
  const QuranDetailsItem({super.key});

  @override
  State<QuranDetailsItem> createState() => _QuranDetailsItemState();
}

class _QuranDetailsItemState extends State<QuranDetailsItem> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: theme.primaryColor,
        border: Border.all(color: theme.primaryColor),
      ),
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
