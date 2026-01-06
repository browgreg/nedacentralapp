import 'package:get/get.dart';
import 'package:neda_central/features/honours/view/honours_screen.dart';

import '../features/honours/bindings/honours_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.honours,
      page: () => const HonoursScreen(),
      binding: HonoursBinding(),
    ),
  ];
}
