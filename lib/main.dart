import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:neda_central/routes/app_pages.dart';
import 'package:neda_central/routes/app_routes.dart';

import 'app/bindings/app_bindings.dart';
import 'core/config/app_config.dart';
import 'core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const NedaApp());
}

class NedaApp extends StatelessWidget {
  const NedaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NEDA Central',
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      initialRoute: _initialRoute(),
      getPages: AppPages.pages,
      builder: (context, child) {
        if (!AppConfig.isDevMode) return child!;
        return Banner(
          message: 'DEV',
          location: BannerLocation.topEnd,
          color: Colors.redAccent,
          child: child!,
        );
      },
      unknownRoute: GetPage(
        name: '/404',
        page: () => const Scaffold(
          body: Center(child: Text('Route not found')),
        ),
      ),
      theme: AppTheme.light(),
    );
  }

  /// Dev-aware initial route selector
  String _initialRoute() {
    if (AppConfig.isDevMode && AppConfig.showHonoursAsHome) {
      return AppRoutes.honours;
    }
    return AppRoutes.admin;
  }
}
