import 'package:get/get.dart';

import 'fifty_one_eight_entry.dart';
import 'fifty_one_eight_mapper.dart';
import 'fifty_one_eight_service.dart';

class FiftyOneEightiesController extends GetxController {
  final stats = <StatEntry>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;

    final raw = await FiftyOneEightiesService.fetch();

    stats.assignAll(
      raw.map(
        (e) => FiftyOneEightiesMapper.fromJson(
          Map<String, dynamic>.from(e),
        ),
      ),
    );

    isLoading.value = false;
  }
}
