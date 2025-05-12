import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jdf/core/app_data_config_model.dart';
import 'package:jdf/presentation/screens/dynamic_screen.dart';
import 'package:jdf/presentation/screens/t1.dart';
import 'package:jdf/utils/extenstions.dart';

class CustomApp extends StatelessWidget {
  final AppDataConfigModel appDataConfigModel;
  const CustomApp({required this.appDataConfigModel, super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: appDataConfigModel.appName,
            themeMode:
                appDataConfigModel.themeConfig.isDarkMode
                    ? ThemeMode.dark
                    : ThemeMode.light,
            theme: ThemeData(
              primaryColor: fromHex(
                appDataConfigModel.themeConfig.primaryColor,
              ),
              scaffoldBackgroundColor: fromHex(
                appDataConfigModel.themeConfig.backgroundColor,
              ),
              textTheme: TextTheme(
                bodyLarge: TextStyle(
                  color: fromHex(appDataConfigModel.themeConfig.textColor),
                ),
                bodyMedium: TextStyle(
                  color: fromHex(appDataConfigModel.themeConfig.textColor),
                ),
              ),
              colorScheme: ColorScheme.light(
                primary: fromHex(appDataConfigModel.themeConfig.primaryColor),
                secondary: fromHex(
                  appDataConfigModel.themeConfig.secondaryColor,
                ),
              ),
            ),
            darkTheme: ThemeData(
              primaryColor: fromHex(
                appDataConfigModel.themeConfig.primaryColor,
              ),
              scaffoldBackgroundColor: fromHex(
                appDataConfigModel.themeConfig.darkTheme?['backgroundColor'] ??
                    "#121212",
              ),
              textTheme: TextTheme(
                bodyLarge: TextStyle(
                  color: fromHex(
                    appDataConfigModel.themeConfig.darkTheme?['textColor'] ??
                        "#E0E0E0",
                  ),
                ),
                bodyMedium: TextStyle(
                  color: fromHex(
                    appDataConfigModel.themeConfig.darkTheme?['textColor'] ??
                        "#E0E0E0",
                  ),
                ),
              ),
              colorScheme: ColorScheme.dark(
                primary: fromHex(appDataConfigModel.themeConfig.primaryColor),
                secondary: fromHex(
                  appDataConfigModel.themeConfig.secondaryColor,
                ),
              ),
            ),
            routes: appDataConfigModel.routes.asMap().map(
              (key, value) => MapEntry(value, (context) {
                final screen = appDataConfigModel.screens.firstWhere(
                  (screen) => screen.routeName == value,
                );
                return DynamicScreen(screenData: screen);
              }),
            ),
            initialRoute: appDataConfigModel.intialRoute,
          ),
    );
  }
}
