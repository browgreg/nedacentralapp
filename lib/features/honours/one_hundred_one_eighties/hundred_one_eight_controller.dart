import 'package:get/get.dart';

import 'hundred_one_eight_entry.dart';
import 'hundred_one_eight_mapper.dart';
import 'hundred_one_eighties_service.dart';

class HundredOneEightiesController extends GetxController {
  final stats = <Stat100Entry>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;

    final raw = await HundredOneEightiesService.fetch();

    stats.assignAll(
      raw.map(
        (e) => HundredOneEightiesMapper.fromJson(
          Map<String, dynamic>.from(e),
        ),
      ),
    );

    isLoading.value = false;
  }
}
