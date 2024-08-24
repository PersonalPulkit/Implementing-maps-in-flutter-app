import 'package:flutter/material.dart';
import 'package:noti/providers/dashboard_provider.dart';
import 'package:provider/provider.dart';

import 'providers/theme_provider.dart';
import 'routes/app_routes.dart';
import 'utils/themes/theme.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => DashboardProvider()),
      ChangeNotifierProvider(create: (context) => ThemeProvider())
    ],
    child: const MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, ThemeProvider value, Widget? child) {
        return MaterialApp(
          themeMode: value.getThemeMode,
          theme: AppTheme.lightTheme,
          highContrastTheme: ThemeData(),
          highContrastDarkTheme: ThemeData(),
          darkTheme: AppTheme.darkTheme,
          initialRoute: AppRoutes.dashboard,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
