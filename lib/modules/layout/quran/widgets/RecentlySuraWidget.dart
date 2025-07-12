import 'package:assignmenthb/core/routes/pages_route_name.dart';
import 'package:assignmenthb/models/suramodel.dart';
import 'package:flutter/material.dart';

import 'RecentlySuraCardItem.dart' show RecentlySuraCardItem;

class RecentlySuraWidget extends StatelessWidget {
  const RecentlySuraWidget({super.key, required this.suraDataModel});

  final List<SuraData> suraDataModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text("Most Recently ", style: theme.textTheme.bodyLarge),
        ),
        SizedBox(
          height: 155,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  PagesRouteName.QuranDetailsView1,
                  arguments: suraDataModel[index],
                );
              },
              child: RecentlySuraCardItem(suraData: suraDataModel[index]),
            ),
            separatorBuilder: (context, index) => SizedBox(width: 10),
            itemCount: suraDataModel.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
