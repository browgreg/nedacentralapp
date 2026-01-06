import 'package:get/get.dart';

import '../../../services/api/memorial_api.dart';
import 'memorial_entry.dart';

class MemorialController extends GetxController {
  final memorials = <MemorialEntry>[].obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    final data = await MemorialApi.fetchMemorials();
    memorials.assignAll(data);
    print('🟢 Memorials loaded: ${memorials.length}');
  }
}
