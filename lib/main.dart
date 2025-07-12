import 'package:assignmenthb/core/services/local_storage_services.dart';
import 'package:assignmenthb/core/theme/theme_manager.dart';
import 'package:assignmenthb/modules/splash/SplashView.dart';
import 'package:flutter/material.dart';

import 'core/routes/route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeManager.lightTheme,
      debugShowCheckedModeBanner: false,
      home: SplashView(),
      // initialRoute:PagesRouteName.splash ,
      routes: Routes.route,
    );
  }
}
