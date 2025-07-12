import 'package:assignmenthb/models/hadithDataModel.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';

class HadithWidget extends StatelessWidget {
  const HadithWidget({super.key, required this.hadithDataModel});

  final HadithDataModel hadithDataModel;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size;
    final width = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Container(
      width: width.width * 0.7,
      height: height.height * 0.06,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: theme.primaryColor,
      ),
      child: Stack(
        children: [
          Image(
            image: AssetImage(Assets.hadithbgslider),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          ListView(
            children: [
              Text(
                hadithDataModel.title,
                style: theme.textTheme.bodyLarge!.copyWith(color: Colors.black),
              ),
              Text(
                hadithDataModel.content,
                style: theme.textTheme.bodyLarge!.copyWith(color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
