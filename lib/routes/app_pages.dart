import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/user_role.dart';
import '../core/config/app_config.dart';
// ADMIN
import '../core/widgets/forbidden_screen.dart';
import '../features/admin/dashboard/admin_dashboard_screen.dart';
import '../features/admin/doubles_champions/admin_doubles_champions_screen.dart';
import '../features/admin/life_members/admin_life_members_screen.dart';
import '../features/admin/one_seventy_club/admin_one_seventy_club_screen.dart';
import '../features/admin/presidents/admin_presidents_screen.dart';
import '../features/admin/singles_champions/admin_singles_champions_screen.dart';
import '../features/admin/team_champions/admin_team_champions_screen.dart';
import '../features/captain/dashboard/captainscorin.dart';
import '../features/fixtures/view/fixtures_screen.dart';
import '../features/honours/bindings/honours_binding.dart';
import '../features/honours/view/honours_screen.dart';
// PUBLIC
import '../features/landing/bindings/landing_binding.dart';
import '../features/landing/view/landing_screen.dart';
import '../routes/app_routes.dart';
// Middlewares (guards)
import 'middlewares/admin_guard.dart';
import 'middlewares/base_role_guard.dart';
import 'middlewares/captain_guard.dart';
import 'middlewares/committee_guard.dart';

// (Optional placeholders for future)
class _ComingSoon extends StatelessWidget {
  final String title;

  const _ComingSoon(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(child: Text('Coming soon')),
    );
  }
}

class AppPages {
  static final pages = <GetPage>[
    // ─────────────────────────
    // PUBLIC
    // ─────────────────────────
    GetPage(
      name: AppRoutes.landing,
      page: () => const LandingScreen(),
      binding: LandingBinding(),
    ),
    GetPage(
      name: AppRoutes.honours,
      page: () => const HonoursScreen(),
      binding: HonoursBinding(),
    ),
    GetPage(
      name: AppRoutes.fixtures,
      page: () => const FullFixturesScreen(),
    ),
    GetPage(
      name: AppRoutes.results,
      page: () => const FullResultsScreen(),
    ),

    // ─────────────────────────
    // ADMIN (guarded)
    // ─────────────────────────
    GetPage(
      name: AppRoutes.admin,
      middlewares: [
        AdminGuard(),
      ],
      page: () => AppConfig.isDevMode
          ? const AdminDashboardScreen()
          : const SizedBox.shrink(),
    ),

    // ADMIN → HONOURS
    GetPage(
      name: AppRoutes.adminPresidents,
      middlewares: [AdminGuard()],
      page: () => const AdminPresidentsScreen(),
    ),
    GetPage(
      name: AppRoutes.adminLifeMembers,
      middlewares: [AdminGuard()],
      page: () => const AdminLifeMembersScreen(),
    ),
    GetPage(
      name: AppRoutes.adminSinglesChampions,
      middlewares: [AdminGuard()],
      page: () => const AdminSinglesChampionsScreen(),
    ),
    GetPage(
      name: AppRoutes.adminDoublesChampions,
      middlewares: [AdminGuard()],
      page: () => const AdminDoublesChampionsScreen(),
    ),
    GetPage(
      name: AppRoutes.adminTeamsChampions,
      middlewares: [AdminGuard()],
      page: () => const AdminTeamChampionsScreen(),
    ),
    GetPage(
      name: AppRoutes.adminOneSeventyClub,
      middlewares: [AdminGuard()],
      page: () => const AdminOneSeventyClubScreen(),
    ),

    // ADMIN → LEAGUE (coming soon)
    GetPage(
      name: AppRoutes.adminLeagues,
      middlewares: [AdminGuard()],
      page: () => const _ComingSoon('Admin • Leagues'),
    ),
    GetPage(
      name: AppRoutes.adminLeagueFixtures,
      middlewares: [AdminGuard()],
      page: () => const _ComingSoon('Admin • Fixtures'),
    ),
    GetPage(
      name: AppRoutes.adminLeagueResults,
      middlewares: [AdminGuard()],
      page: () => const _ComingSoon('Admin • Results'),
    ),
    GetPage(
      name: AppRoutes.adminLeagueLadders,
      middlewares: [AdminGuard()],
      page: () => const _ComingSoon('Admin • Ladders'),
    ),
    GetPage(
      name: AppRoutes.adminScoring,
      middlewares: [AdminGuard()],
      page: () => const _ComingSoon('Admin • Scoring'),
    ),

    // ─────────────────────────
    // COMMITTEE (guarded)
    // ─────────────────────────
    GetPage(
      name: AppRoutes.adminCommittee,
      page: () => const CommitteeDashboardScreen(),
      middlewares: [
        BaseRoleGuard([
          UserRole.SUPER_ADMIN,
          UserRole.ADMIN,
          UserRole.COMMITTEE,
        ])
      ],
    ),
    GetPage(
      name: AppRoutes.adminCommitteeMembers,
      middlewares: [CommitteeGuard()],
      page: () => const _ComingSoon('Committee • Members'),
    ),
    GetPage(
      name: AppRoutes.adminFundraising,
      middlewares: [CommitteeGuard()],
      page: () => const _ComingSoon('Committee • Fundraising'),
    ),
    GetPage(
      name: AppRoutes.adminCommitteeDocuments,
      middlewares: [CommitteeGuard()],
      page: () => const _ComingSoon('Committee • Documents'),
    ),
    GetPage(
      name: '/403',
      page: () => const ForbiddenScreen(),
    ),
    // ─────────────────────────
    // CAPTAIN (guarded)
    // ─────────────────────────
    GetPage(
      name: AppRoutes.captainHub,
      middlewares: [CaptainGuard()],
      page: () => const _ComingSoon('Captain Dashboard'),
    ),
    GetPage(
      name: AppRoutes.captainTeams,
      middlewares: [CaptainGuard()],
      page: () => const _ComingSoon('Captain • Teams'),
    ),
    GetPage(
      name: AppRoutes.captainResults,
      middlewares: [CaptainGuard()],
      page: () => const _ComingSoon('Captain • Results'),
    ),
    GetPage(
      name: AppRoutes.captainScoring,
      middlewares: [CaptainGuard()],
      page: () => const _ComingSoon('Captain • Scoring'),
    ),

    // ─────────────────────────
    // PLAYER (unguarded for now — you can add a PlayerGuard later)
    // ─────────────────────────
    GetPage(
      name: AppRoutes.playerHub,
      page: () => const _ComingSoon('Player Hub'),
    ),
    GetPage(
      name: AppRoutes.playerScoring,
      page: () => const _ComingSoon('Player • Scoring'),
    ),
    GetPage(
      name: AppRoutes.playerStats,
      page: () => const _ComingSoon('Player • Stats'),
    ),

    // ─────────────────────────
    // COMPETITION (choose guard later: AdminGuard or CommitteeGuard)
    // ─────────────────────────
    GetPage(
      name: AppRoutes.competitionHub,
      middlewares: [AdminGuard()],
      page: () => const _ComingSoon('Competition Dashboard'),
    ),
    GetPage(
      name: AppRoutes.competitionBrackets,
      middlewares: [AdminGuard()],
      page: () => const _ComingSoon('Competition • Brackets'),
    ),
    GetPage(
      name: AppRoutes.competitionRegistration,
      middlewares: [AdminGuard()],
      page: () => const _ComingSoon('Competition • Registration'),
    ),
    GetPage(
      name: AppRoutes.competitionPublish,
      middlewares: [AdminGuard()],
      page: () => const _ComingSoon('Competition • Publish Results'),
    ),
  ];
}
