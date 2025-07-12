import 'package:flutter/material.dart';

class PrayerItem extends StatelessWidget {
  PrayerItem({
    super.key,
    required this.sala,
    required this.time,
    required this.period,
  });

  String sala;
  String time;
  String period;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 20),
      child: Container(
        width: 86,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Color(0xff202020), theme.primaryColor],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(sala, style: theme.textTheme.bodyLarge),
            Text(
              time,
              style: theme.textTheme.headlineSmall!.copyWith(
                color: Colors.white,
              ),
            ),
            Text(period),
          ],
        ),
      ),
    );
  }
}
