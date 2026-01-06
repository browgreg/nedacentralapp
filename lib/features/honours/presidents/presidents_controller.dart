import 'package:get/get.dart';
import 'package:neda_central/features/honours/presidents/president_entry.dart';

import '../../../services/api/presidents_api.dart';

class PresidentsController extends GetxController {
  final presidents = <PresidentEntry>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadPresidents();
  }

  Future<void> loadPresidents() async {
    final dtoList = await PresidentsApi.fetchPresidents();

    presidents.assignAll(
      dtoList.map(
        (p) => PresidentEntry(
          name: p.name,
          startYear: p.startYear,
          endYear: p.endYear,
        ),
      ),
    );
  }
}
