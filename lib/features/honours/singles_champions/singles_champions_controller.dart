import 'package:get/get.dart';

import '../../admin/singles_champions/singles_champion_entry.dart';
import 'singles_champions_mapper.dart';
import 'singles_champions_service.dart';

class SinglesChampionsController extends GetxController {
  final champions = <SinglesChampionEntry>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadChampions();
  }

  Future<void> loadChampions() async {
    isLoading.value = true;

    final raw = await SinglesChampionsService.fetch();

    champions.assignAll(
      raw.map(
        (e) => SinglesChampionsMapper.fromJson(
          Map<String, dynamic>.from(e),
        ),
      ),
    );

    isLoading.value = false;
  }
}
