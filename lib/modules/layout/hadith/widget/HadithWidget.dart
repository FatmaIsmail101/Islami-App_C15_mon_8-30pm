import 'package:assignmenthb/models/hadithDataModel.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';

class HadithWidget extends StatelessWidget {
  const HadithWidget({super.key,
    required this.hadithDataModel});

  final HadithDataModel hadithDataModel;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size;
    final width = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Container(
      width: width.width * 0.7,
      height: height.height * 0.6,
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
          SingleChildScrollView(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    hadithDataModel.title,
                    style: theme.textTheme.headlineSmall!.copyWith(
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    hadithDataModel.content,
                    style: theme.textTheme.bodyLarge!.copyWith(
                        color: Colors.black),
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
