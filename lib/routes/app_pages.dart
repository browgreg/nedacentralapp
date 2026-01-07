import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neda_central/features/fixtures/view/fixtures_screen.dart';
import 'package:neda_central/features/honours/view/honours_screen.dart';

import '../core/config/app_config.dart';
import '../features/admin/view/admin_dashboard_screen.dart';
import '../features/honours/bindings/honours_binding.dart';
import '../features/landing/bindings/landing_binding.dart';
import '../features/landing/view/landing_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.landing,
      page: () => const LandingScreen(),
      binding: LandingBinding(),
    ),
    GetPage(
      name: AppRoutes.admin,
      page: () => AppConfig.isDevMode
          ? const AdminDashboardScreen()
          : const SizedBox.shrink(),
    ),
    GetPage(
      name: AppRoutes.fixtures,
      page: () => const FullFixturesScreen(),
    ),
    GetPage(
      name: AppRoutes.honours,
      page: () => const HonoursScreen(),
      binding: HonoursBinding(),
    ),
  ];
}
