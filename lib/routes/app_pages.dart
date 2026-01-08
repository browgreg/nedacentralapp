import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neda_central/features/admin/doubles_champions/admin_doubles_champions_screen.dart';
import 'package:neda_central/features/admin/life_members/admin_life_members_screen.dart';
import 'package:neda_central/features/admin/singles_champions/admin_singles_champions_screen.dart';
import 'package:neda_central/features/admin/team_champions/admin_team_champions_screen.dart';
import 'package:neda_central/features/fixtures/view/fixtures_screen.dart';
import 'package:neda_central/features/honours/view/honours_screen.dart';

import '../core/config/app_config.dart';
import '../features/admin/dashboard/admin_dashboard_screen.dart';
import '../features/admin/presidents/admin_presidents_screen.dart';
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
    GetPage(
      name: '/admin',
      page: () => const AdminDashboardScreen(),
    ),
    GetPage(
      name: '/admin/presidents',
      page: () => const AdminPresidentsScreen(),
    ),
    GetPage(
      name: '/admin/lifeMembers',
      page: () => const AdminLifeMembersScreen(),
    ),
    GetPage(
      name: '/admin/teamsChampions',
      page: () => const AdminTeamChampionsScreen(),
    ),
    GetPage(
      name: '/admin/singlesChampions',
      page: () => const AdminSinglesChampionsScreen(),
    ),
    GetPage(
      name: '/admin/doublesChampions',
      page: () => const AdminDoublesChampionsScreen(),
    ),
  ];
}
