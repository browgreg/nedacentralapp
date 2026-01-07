import 'package:get/get.dart';

import 'doubles_champion_entry.dart';
import 'doubles_champions_mapper.dart';
import 'doubles_champions_service.dart';

class DoublesChampionsController extends GetxController {
  final champions = <DoublesChampionEntry>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadChampions();
  }

  Future<void> loadChampions() async {
    isLoading.value = true;

    final raw = await DoublesChampionsService.fetch();

    champions.assignAll(
      raw.map(
        (e) => DoublesChampionsMapper.fromJson(
          Map<String, dynamic>.from(e),
        ),
      ),
    );

    isLoading.value = false;
  }
}
