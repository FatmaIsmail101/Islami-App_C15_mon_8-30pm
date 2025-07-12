import 'package:assignmenthb/models/suramodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../../../../core/constants/assets.dart';

class SuraItem extends StatelessWidget {
  final VoidCallback onSuraTap;

  const SuraItem({super.key, required this.data, required this.onSuraTap});

  final SuraData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Bounceable(
        onTap: onSuraTap,
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(Assets.SuraListIcon)),
              ),
              child: Text("${data.id}", style: theme.textTheme.titleLarge),
            ),
            SizedBox(width: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.suraNameEn, style: theme.textTheme.titleLarge),
                Text(
                  "${data.suraNumber} Verses  ",
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
            Spacer(),
            Text(data.suraNameAR, style: theme.textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
