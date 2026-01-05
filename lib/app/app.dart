import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/analytics/app_lifecycle_observer.dart';
import '../core/theme/app_theme.dart';
import '../routes/app_pages.dart';
import '../routes/app_routes.dart';
import 'bindings/app_bindings.dart';

class NedaApp extends StatefulWidget {
  const NedaApp({super.key});

  @override
  State<NedaApp> createState() => _NedaAppState();
}

class _NedaAppState extends State<NedaApp> {
  final _lifecycleObserver = AppLifecycleObserver();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(_lifecycleObserver);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_lifecycleObserver);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NEDA',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      initialBinding: AppBindings(),
      initialRoute: AppRoutes.landing,
      getPages: AppPages.pages,
    );
  }
}