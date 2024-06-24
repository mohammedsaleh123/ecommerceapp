import 'package:ecommerceapp/core/app_theme.dart';
//import 'package:ecommerceapp/feutures/auth/view/signin_view.dart';
import 'package:ecommerceapp/feutures/home/view/nav_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isDark = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeDataService().getThemePreference();

  runApp(const MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: isDark == false
            ? AppTheme().myLightTheme()
            : AppTheme().myDarkTheme(),
        home: const NavBarView(),
      ),
    );
  }

  ThemeData initialTheme(bool isDark) {
    if (isDark == true) {
      return AppTheme().myDarkTheme();
    } else {
      return AppTheme().myLightTheme();
    }
  }
}

class ThemeDataService {
  static final ThemeDataService _instance = ThemeDataService._internal();

  factory ThemeDataService() {
    return _instance;
  }

  ThemeDataService._internal();

  Future<bool> getThemePreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isDark = prefs.getBool('isDark') ?? false;
    return isDark; // Default to light theme
  }

  Future<void> saveThemePreference(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isDark', value);
  }
}
