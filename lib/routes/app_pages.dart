import 'package:get/get.dart';

import '../features/honours/view/honours_statistics_screen.dart';
import '../features/landing/bindings/landing_binding.dart';
import '../features/landing/view/landing_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.landing,
      page: () => const LandingScreen(),
      binding: LandingBinding(), // ✅ THIS IS CRITICAL
    ),
    GetPage(
      name: AppRoutes.honours,
      page: () => const HonoursStatisticsScreen(),
    ),
  ];
}
