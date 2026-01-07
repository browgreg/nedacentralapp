import 'package:get/get.dart';
import 'package:neda_central/features/honours/ten_one_seventy_ones/ten_one_seventy_one_entry.dart';
import 'package:neda_central/features/honours/ten_one_seventy_ones/ten_one_seventy_one_mapper.dart';

import 'ten_one_seventy_ones_service.dart';

class TenOneSeventyOnesController extends GetxController {
  final stats = <Stat171Entry>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;

    final raw = await TenOneSeventyOnesService.fetch();

    stats.assignAll(
      raw.map(
        (e) => TenOneSeventyOnesMapper.fromJson(
          Map<String, dynamic>.from(e),
        ),
      ),
    );

    isLoading.value = false;
  }
}
