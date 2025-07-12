import 'package:flutter/material.dart';

import '../../core/constants/assets.dart';
import '../../core/routes/pages_route_name.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, PagesRouteName.Screen1);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.splash_background_image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
