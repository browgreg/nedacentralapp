import 'package:get/get.dart';

import '../../../../services/api/captain_team_api.dart';
import '../../model/captain_player.dart';
import '../../model/captain_team.dart';

class CaptainTeamController extends GetxController {
  final selected = <int>{}.obs;
  final reserveRego = RxnInt();

  final isLocked = false.obs;
  final isSaving = false.obs;
  final isLoading = false.obs;

  late CaptainTeam team;

  /// Called once from screen
  void init(CaptainTeam team) {
    this.team = team;
    loadSelection();
  }

  /// 🔹 Load selection + lock state from backend
  Future<void> loadSelection() async {
    try {
      isLoading.value = true;

      final res = await CaptainTeamApi.fetchSelection(team.id);

      selected.assignAll(
        (res?['selected'] as List).cast<int>(),
      );

      reserveRego.value = res?['reserve'];
      isLocked.value = res?['locked'];
    } finally {
      isLoading.value = false;
    }
  }

  /// 🔹 Toggle player (max 8)
  void togglePlayer(CaptainPlayer p) {
    if (isLocked.value) return;

    if (selected.contains(p.rego)) {
      selected.remove(p.rego);

      if (reserveRego.value == p.rego) {
        reserveRego.value = null;
      }
    } else {
      if (selected.length >= 8) return;
      selected.add(p.rego);
    }
  }

  /// 🔹 Set reserve player
  void setReserve(CaptainPlayer p) {
    if (isLocked.value) return;
    if (!selected.contains(p.rego)) return;

    reserveRego.value = p.rego;
  }

  /// 🔹 Save allowed?
  bool get canSave =>
      !isLocked.value &&
      selected.length == 8 &&
      (reserveRego.value == null || selected.contains(reserveRego.value));

  /// 🔹 Persist selection
  Future<void> save() async {
    if (!canSave) return;

    isSaving.value = true;

    try {
      await CaptainTeamApi.saveSelection(
        teamId: team.id,
        players: selected.toList(),
        reserve: reserveRego.value,
      );
    } finally {
      isSaving.value = false;
    }
  }
}
