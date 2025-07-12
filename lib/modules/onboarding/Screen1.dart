import 'package:assignmenthb/core/routes/pages_route_name.dart';
import 'package:assignmenthb/core/theme/color_palette.dart';
import 'package:flutter/material.dart';

import '../../core/constants/assets.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.onBoarding1),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomRight,
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, PagesRouteName.Screen2);
          },
          child: Text(
            'Next',
            style: TextStyle(
              color: ColorPalette.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
