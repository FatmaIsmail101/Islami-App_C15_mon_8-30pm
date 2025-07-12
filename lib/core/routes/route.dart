import 'package:assignmenthb/core/routes/pages_route_name.dart';
import 'package:assignmenthb/modules/layout/LayoutView.dart';
import 'package:assignmenthb/modules/layout/hadith/HadithTap.dart';
import 'package:assignmenthb/modules/layout/quran/QuranTab.dart';
import 'package:assignmenthb/modules/layout/radio/RadioTap.dart';
import 'package:assignmenthb/modules/layout/sebha/SebhaTap.dart';
import 'package:assignmenthb/modules/layout/time/TimeTap.dart';
import 'package:assignmenthb/modules/onboarding/Screen1.dart';
import 'package:assignmenthb/modules/splash/SplashView.dart';
import 'package:flutter/material.dart';

import '../../modules/layout/quran/widgets/QuranDetailsView1.dart';
import '../../modules/onboarding/Screen2.dart';
import '../../modules/onboarding/Screen3.dart';
import '../../modules/onboarding/Screen4.dart';
import '../../modules/onboarding/Screen5.dart';

abstract class Routes {
  static final Map<String, Widget Function(BuildContext)> route = {
    PagesRouteName.splash: (context) => SplashView(),
    PagesRouteName.Screen1: (context) => Screen1(),
    PagesRouteName.Screen2: (context) => Screen2(),
    PagesRouteName.Screen3: (context) => Screen3(),
    PagesRouteName.Screen4: (context) => Screen4(),
    PagesRouteName.Screen5: (context) => Screen5(),
    PagesRouteName.layoutView: (context) => LayoutView(),

    PagesRouteName.QuranVeiw: (context) => QuranTab(),
    PagesRouteName.HadithVeiw: (context) => HadithTap(),
    PagesRouteName.SebhaVeiw: (context) => SebhaTap(),
    PagesRouteName.RadioVeiw: (context) => RadioTap(),
    PagesRouteName.TimeVeiw: (context) => TimeTap(),

    PagesRouteName.QuranDetailsView1: (context) => QuranDetailsView1(),
  };
}
