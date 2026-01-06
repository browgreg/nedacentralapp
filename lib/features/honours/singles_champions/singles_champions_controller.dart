import 'package:get/get.dart';

import 'singles_champion_entry.dart';
import 'singles_champions_service.dart';

class SinglesChampionsController extends GetxController {
  final entries = <SinglesChampionEntry>[].obs;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  Future<void> _load() async {
    final data = await SinglesChampionsService.fetch();
    entries.assignAll(data);
  }

  /// Group by division for UI
  Map<int, List<SinglesChampionEntry>> get groupedByDivision {
    final map = <int, List<SinglesChampionEntry>>{};
    for (final e in entries) {
      map.putIfAbsent(e.division, () => []).add(e);
    }
    return map;
  }
}
