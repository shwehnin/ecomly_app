import 'package:get/get.dart';
import 'app/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_task/app/theme/theme.dart';
import 'package:my_task/app/data/db/db_helper.dart';
import 'package:my_task/app/ui/splash/splash_page.dart';
import 'package:my_task/app/services/theme_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task App',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeService().theme,
      home: const HomePage(),
    );
  }
}
