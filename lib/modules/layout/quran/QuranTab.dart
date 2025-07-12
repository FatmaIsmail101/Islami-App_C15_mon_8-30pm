import 'package:assignmenthb/core/constants/constants.dart';
import 'package:assignmenthb/core/services/local_storage_keys.dart';
import 'package:assignmenthb/core/services/local_storage_services.dart';
import 'package:assignmenthb/modules/layout/quran/widgets/RecentlySuraWidget.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/assets.dart';
import '../../../core/routes/pages_route_name.dart';
import '../../../models/suramodel.dart';
import 'widgets/SuraListWidget.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    loadRecentData();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.QuranBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          spacing: 20,
          children: [
            Image(image: AssetImage(Assets.HeaderLogo)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                onChanged: (value) {
                  searchQuery = value;
                  search();
                  setState(() {});
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: theme.primaryColor),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ImageIcon(
                      AssetImage(Assets.SearchIcon),
                      color: theme.primaryColor,
                    ),
                  ),
                  hintText: "Sura Name",
                  hintStyle: theme.textTheme.bodyLarge,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: theme.primaryColor),
                  ),
                ),
              ),
            ),

            Visibility(
              visible: searchQuery.isEmpty,
              replacement: SuraListWidget(
                onSuraTap: onSuraTap,
                suraData: searchSuraList,
              ),
              child: Column(
                children: [
                  recentSuraList.isNotEmpty
                      ? RecentlySuraWidget(suraDataModel: recentSuraList)
                      : Text("No Recent"),
                  SuraListWidget(
                    onSuraTap: onSuraTap,
                    suraData: Constants.allSuras,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> recentSuraIndexList = [];

  List<SuraData> recentSuraList = [];

  onSuraTap(int index) {
    _cacheIndex(index);
    Navigator.pushNamed(
      context,
      PagesRouteName.QuranDetailsView1,
      arguments: Constants.allSuras[index],
    );
  }

  _cacheIndex(int index) {
    var indexString = index.toString();
    if (recentSuraIndexList.contains(indexString)) {
      return;
    }
    if (recentSuraIndexList.length == 5) {
      recentSuraIndexList.removeLast();
    }
    recentSuraIndexList.insert(0, indexString);
    LocalStorageServices.srtStringList(
      LocalStorageKeys.recentSuras,
      recentSuraIndexList,
    );
    loadRecentData();
    setState(() {});
  }

  loadRecentData() {
    recentSuraIndexList = [];
    recentSuraList = [];
    recentSuraIndexList =
        LocalStorageServices.getStringList(LocalStorageKeys.recentSuras) ?? [];
    for (var index in recentSuraIndexList) {
      int indexInt = int.parse(index);
      recentSuraList.add(Constants.allSuras[indexInt]);
    }
  }

  List<SuraData> searchSuraList = [];

  void search() {
    searchSuraList = [];
    for (var sura in Constants.allSuras) {
      if (sura.suraNameEn.toLowerCase().contains(searchQuery.toLowerCase()) ||
          sura.suraNameAR.toLowerCase().contains(searchQuery.toLowerCase())) {
        searchSuraList.add(sura);
      }
    }
  }
}
