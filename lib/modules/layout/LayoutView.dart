import 'package:assignmenthb/modules/layout/hadith/HadithTap.dart';
import 'package:assignmenthb/modules/layout/quran/QuranTab.dart';
import 'package:assignmenthb/modules/layout/radio/RadioTap.dart';
import 'package:assignmenthb/modules/layout/sebha/SebhaTap.dart';
import 'package:assignmenthb/modules/layout/time/TimeTap.dart';
import 'package:flutter/material.dart';

import '../../core/constants/assets.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int selectedIndex = 0;
  List<Widget> screens = [
    QuranTab(),
    HadithTap(),
    SebhaTap(),
    RadioTap(),
    TimeTap(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: Colors.black45,
              ),

              child: ImageIcon(AssetImage(Assets.QuranTap)),
            ),
            icon: ImageIcon(AssetImage(Assets.QuranTap)),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: Colors.black45,
              ),

              child: ImageIcon(AssetImage(Assets.HadithTap)),
            ),
            icon: ImageIcon(AssetImage(Assets.HadithTap)),
            label: 'Hadith',
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: Colors.black45,
              ),

              child: ImageIcon(AssetImage(Assets.QuranTap)),
            ),
            icon: ImageIcon(AssetImage(Assets.SebhaTap)),
            label: 'Sebha',
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: Colors.black45,
              ),

              child: ImageIcon(AssetImage(Assets.QuranTap)),
            ),
            icon: ImageIcon(AssetImage(Assets.RadioTap)),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: Colors.black45,
              ),

              child: ImageIcon(AssetImage(Assets.QuranTap)),
            ),
            icon: ImageIcon(AssetImage(Assets.TimeTap)),
            label: 'Time',
          ),
        ],
      ),
    );
  }
}
