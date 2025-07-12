import 'package:assignmenthb/modules/layout/time/widget/AzkarItem.dart';
import 'package:assignmenthb/modules/layout/time/widget/PrayerItem.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/assets.dart';

class TimeTap extends StatelessWidget {
  TimeTap({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.TimeBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              Image(image: AssetImage(Assets.HeaderLogo)),
              Stack(
                children: [
                  Container(
                    width: 390,
                    height: 301,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color(0xff856B3F),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("16 Jul,", style: theme.textTheme.bodyLarge),
                              Text("2024", style: theme.textTheme.bodyLarge),
                            ],
                          ),
                          Column(
                            children: [
                              Text("09 Muh,", style: theme.textTheme.bodyLarge),
                              Text("1446", style: theme.textTheme.bodyLarge),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(Assets.prayerTime),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  "Pray Time",
                                  style: theme.textTheme.titleLarge!.copyWith(
                                    color: Color(0xB3202020),
                                  ),
                                ),
                              ),
                            ),

                            Text(
                              "Tuesday",
                              style: theme.textTheme.titleLarge!.copyWith(
                                color: Color(0xB3202020),
                              ),
                            ),

                            SizedBox(
                              height: 150,
                              child: Expanded(
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => PrayerItem(
                                    sala: sala[index],
                                    time: time[index],
                                    period: period[index],
                                  ),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(width: 20),
                                  itemCount: sala.length,
                                ),
                              ),
                            ),

                            SizedBox(height: 20),
                            Row(
                              children: [
                                Center(
                                  child: Text(
                                    "Next Pray - 02:32",
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.volume_off_outlined),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text("Azkar", style: theme.textTheme.bodyLarge),
              ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => AzkarItem(
                  azkarLeft: azkarleft[index],
                  azkarRight: azkarright[index],
                ),
                separatorBuilder: (context, index) => SizedBox(height: 20),
                itemCount: azkarright.length,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> sala = ["Fajr", "Duhr", "Asr", "Maghreb", "Asha"];
  List<String> time = ["4:15", "1:01", "4:38", "7:57", "9:30"];
  List<String> period = ["am", "pm", "pm", "pm", "pm"];
  List<String> azkarleft = [
    "Evening Azkar",
    "After Prayer",
    "Mosque Azkar",
    "Home Azkar",
    "Others Azkar",
  ];
  List<String> azkarright = [
    "Morning Azkar",
    "Pray Azkar",
    "Azan Azkar",
    "Waking up Azkar",
    "Eating Azkar",
  ];
}
