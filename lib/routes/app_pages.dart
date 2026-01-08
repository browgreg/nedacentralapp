import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../core/config/app_config.dart';
import '../features/admin/dashboard/admin_dashboard_screen.dart';
import '../features/admin/doubles_champions/admin_doubles_champions_screen.dart';
import '../features/admin/life_members/admin_life_members_screen.dart';
import '../features/admin/presidents/admin_presidents_screen.dart';
import '../features/admin/singles_champions/admin_singles_champions_screen.dart';
import '../features/admin/team_champions/admin_team_champions_screen.dart';
import '../features/fixtures/view/fixtures_screen.dart';
import '../features/honours/bindings/honours_binding.dart';
import '../features/honours/view/honours_screen.dart';
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

    /// ─────────────────────────
    /// ADMIN
    /// ─────────────────────────
    GetPage(
      name: AppRoutes.admin,
      page: () => AppConfig.isDevMode
          ? const AdminDashboardScreen()
          : const SizedBox.shrink(),
    ),
    GetPage(
      name: AppRoutes.presidents,
      page: () => const AdminPresidentsScreen(),
    ),
    GetPage(
      name: AppRoutes.lifeMembers,
      page: () => const AdminLifeMembersScreen(),
    ),
    GetPage(
      name: AppRoutes.teamsChampions,
      page: () => const AdminTeamChampionsScreen(),
    ),
    GetPage(
      name: AppRoutes.singlesChampions,
      page: () => const AdminSinglesChampionsScreen(),
    ),
    GetPage(
      name: AppRoutes.doublesChampions,
      page: () => const AdminDoublesChampionsScreen(),
    ),

    /// ─────────────────────────
    /// PUBLIC
    /// ─────────────────────────
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
