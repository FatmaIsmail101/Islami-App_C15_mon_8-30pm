import 'package:assignmenthb/models/suramodel.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';

class RecentlySuraCardItem extends StatelessWidget {
  const RecentlySuraCardItem({super.key, required this.suraData});

  final SuraData suraData;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 283,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: theme.primaryColor,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(suraData.suraNameEn, style: theme.textTheme.headlineSmall),
                Text(suraData.suraNameAR, style: theme.textTheme.headlineSmall),
                Text(
                  "${suraData.suraNumber} Verses  ",
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Image(image: AssetImage(Assets.QuranIcon))),
        ],
      ),
    );
  }
}
