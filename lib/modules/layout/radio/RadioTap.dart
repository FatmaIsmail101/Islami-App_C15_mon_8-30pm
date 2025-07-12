import 'package:assignmenthb/modules/layout/radio/widgets/RadioWidget.dart';
import 'package:assignmenthb/modules/layout/radio/widgets/RecitersWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../../../core/constants/assets.dart';

class RadioTap extends StatefulWidget {
  const RadioTap({super.key});

  @override
  State<RadioTap> createState() => _RadioTapState();
}

class _RadioTapState extends State<RadioTap> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.RadioBackground),
          fit: BoxFit.cover,
        ),
      ),

      child: Column(
        spacing: 20,
        children: [
          Image(image: AssetImage(Assets.HeaderLogo)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Bounceable(
                  onTap: () {
                    selectedIndex = 0;
                    setState(() {});
                  },
                  child: Container(
                    width: 185,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: selectedIndex == 0
                          ? theme.primaryColor
                          : Color(0xB3202020),
                    ),
                    child: Text(
                      "Radio",
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: selectedIndex == 0 ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ),
                Bounceable(
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  child: Container(
                    width: 155,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: selectedIndex == 1
                          ? theme.primaryColor
                          : Color(0xB3202020),
                    ),
                    child: Text(
                      "Reciters",
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: selectedIndex == 1 ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: selectedIndex == 0 ? RadioWidget() : RecitersWidget(),
          ),
        ],
      ),
    );
  }
}
