import 'package:get/get.dart';

import '../../../services/api/presidents_api.dart';
import '../model/honour_category.dart';
import '../model/honour_entry.dart';

class HonoursController extends GetxController {
  final selectedCategory = HonourCategory.presidents.obs;
  final isLoading = false.obs;

  final Map<HonourCategory, List<HonourEntry>> data = {
    HonourCategory.presidents: [],
    HonourCategory.lifeMembers: [],
    HonourCategory.inMemoriam: [],
    HonourCategory.teamChampions: [],
    HonourCategory.singlesChampions: [],
    HonourCategory.doublesChampions: [],
    HonourCategory.hundreds180s: [],
    HonourCategory.fifties180s: [],
    HonourCategory.twenties171s: [],
    HonourCategory.club170: [],
  };

  List<HonourEntry> get entries => data[selectedCategory.value] ?? [];

  @override
  void onInit() {
    super.onInit();
    loadPresidents();
  }

  Future<void> loadPresidents() async {
    try {
      isLoading.value = true;

      final res = await PresidentsApi.fetchPresidents();

      final mapped = res.map<HonourEntry>((p) {
        final start = p['startYear'] as int;
        final end = p['endYear'] as int;

        return HonourEntry(
          primary: p['name'],
          secondary: 'Club President',
          period: end == 0 ? '$start – Present' : '$start – $end',
        );
      }).toList();

      data[HonourCategory.presidents]!.assignAll(mapped);

      print('🟢 Presidents loaded: ${mapped.length}');
    } catch (e, s) {
      print('❌ loadPresidents error: $e');
      print(s);
    } finally {
      isLoading.value = false;
    }
  }
}
