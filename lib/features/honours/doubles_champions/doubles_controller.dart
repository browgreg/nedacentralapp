import 'package:get/get.dart';

import 'doubles_champion_entry.dart';
import 'doubles_service.dart';

class DoublesChampionsController extends GetxController {
  final entries = <DoublesChampionEntry>[].obs;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  Future<void> _load() async {
    final data = await DoublesChampionsService.fetch();
    entries.assignAll(data);
  }
}
