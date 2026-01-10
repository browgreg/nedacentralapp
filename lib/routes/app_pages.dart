import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ADMIN
import '../auth/view/change_pin_screen.dart';
import '../auth/view/login_screen.dart';
import '../core/widgets/forbidden_screen.dart';
import '../features/admin/dashboard/admin_dashboard_screen.dart';
import '../features/admin/doubles_champions/view/admin_doubles_champions_screen.dart';
import '../features/admin/life_members/view/admin_life_members_screen.dart';
import '../features/admin/one_seventy_club/view/admin_one_seventy_club_screen.dart';
import '../features/admin/presidents/view/admin_presidents_screen.dart';
import '../features/admin/singles_champions/view/admin_singles_champions_screen.dart';
import '../features/admin/team_champions/view/admin_team_champions_screen.dart';
import '../features/admin/users/view/admin_users_screen.dart';
import '../features/captain/dashboard/captain_dashboard_screen.dart';
import '../features/captain/dashboard/captain_scoring.dart';
import '../features/captain/model/captain_permission.dart';
import '../features/fixtures/view/fixtures_screen.dart';
import '../features/honours/bindings/honours_binding.dart';
import '../features/honours/view/honours_screen.dart';

// PUBLIC
import '../features/landing/bindings/landing_binding.dart';
import '../features/player/dashboard/player_dashboard_screen.dart';
import '../remover.dart';
import '../routes/app_routes.dart';

// Middlewares (guards)
import 'middlewares/admin_guard.dart';
import 'middlewares/captain_guard.dart';
import 'middlewares/captain_permission_guard.dart';
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
      page: () => const LoginScreen(),
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

    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
    ),

    GetPage(
      name: '/changePin',
      page: () => const ChangePinScreen(),
    ),
    // ─────────────────────────
    // ADMIN (guarded)
    // ─────────────────────────
    GetPage(
      name: AppRoutes.admin,
      page: () => const AdminDashboardScreen(),
      middlewares: [AdminGuard()],
    ),

    // ADMIN → HONOURS
    GetPage(
      name: AppRoutes.adminPresidents,
      middlewares: [AdminGuard(), CommitteeGuard()],
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
    GetPage(
      name: AppRoutes.adminUsers,
      page: () => const AdminUsersScreen(),
      middlewares: [AdminGuard()],
    ),
    // ADMIN → LEAGUE (coming soon)
    GetPage(
      name: AppRoutes.adminLeagues,
      middlewares: [AdminGuard(), CommitteeGuard()],
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
      middlewares: [CommitteeGuard()],
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
      name: AppRoutes.captainDashboard,
      page: () => const CaptainDashboardScreen(),
      middlewares: [
        CaptainGuard(),
      ],
    ),

    GetPage(
      name: AppRoutes.captainResults,
      page: () => const CaptainResultsScreen(),
      middlewares: [
        CaptainGuard(),
        CaptainPermissionGuard(CaptainPermission.enterResults),
      ],
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
      page: () => const PlayerDashboardScreen(),
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
