import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';

class AzkarItem extends StatelessWidget {
  AzkarItem({super.key, required this.azkarRight, required this.azkarLeft});

  String azkarLeft;
  String azkarRight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 150,
          height: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: theme.primaryColor),
          ),
          child: Column(
            spacing: 20,
            children: [
              Image(
                image: AssetImage(Assets.azkarLeft),
                width: 185,
                height: 159,
                fit: BoxFit.cover,
              ),
              Text(azkarLeft, style: theme.textTheme.bodyLarge),
            ],
          ),
        ),

        Container(
          width: 150,
          height: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: theme.primaryColor),
          ),
          child: Column(
            spacing: 20,
            children: [
              Image(
                image: AssetImage(Assets.azkarRight),
                width: 185,
                height: 159,
                fit: BoxFit.cover,
              ),
              Text(azkarLeft, style: theme.textTheme.bodyLarge),
            ],
          ),
        ),
      ],
    );
  }
}
