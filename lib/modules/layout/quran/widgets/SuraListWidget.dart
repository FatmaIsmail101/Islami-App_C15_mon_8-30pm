import 'package:assignmenthb/core/constants/constants.dart';
import 'package:assignmenthb/models/suramodel.dart';
import 'package:flutter/material.dart';

import 'SuraItem.dart';

class SuraListWidget extends StatelessWidget {
  const SuraListWidget({
    super.key,
    required this.onSuraTap,
    required this.suraData,
  });

  final void Function(int) onSuraTap;
  final List<SuraData> suraData;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text("Suras List", style: theme.textTheme.bodyLarge),
        ),
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 10),
          itemBuilder: (context, index) => SuraItem(
            onSuraTap: () => onSuraTap(suraData[index].id - 1),
            data: Constants.allSuras[index],
          ),
          separatorBuilder: (context, index) =>
              Divider(indent: 50, endIndent: 50, thickness: 2, height: 20),
          itemCount: suraData.length,
        ),
      ],
    );
  }
}
