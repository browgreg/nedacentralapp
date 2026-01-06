import 'package:get/get.dart';
import 'package:neda_central/features/results/view/full_results_screen.dart';

import '../features/fixtures/view/fixtures_screen.dart';
import '../features/honours/controller/honours_controller.dart';
import '../features/honours/view/honours_screen.dart';
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
      name: AppRoutes.fixtures,
      page: () => const FullFixturesScreen(),
    ),
    GetPage(
      name: AppRoutes.honours,
      page: () => const HonoursScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HonoursController>(() => HonoursController());
      }),
    ),
    GetPage(
      name: AppRoutes.results,
      page: () => const ResultsScreen(),
    ),
  ];
}
