import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/honour_category.dart';
import '../model/honour_entry.dart';

class HonoursController extends GetxController {
  final selectedCategory = HonourCategory.presidents.obs;

  final data = <HonourCategory, RxList<HonourEntry>>{
    HonourCategory.presidents: <HonourEntry>[].obs,
    HonourCategory.lifeMembers: <HonourEntry>[].obs,
    HonourCategory.inMemoriam: <HonourEntry>[].obs,
    HonourCategory.teamChampions: <HonourEntry>[].obs,
    HonourCategory.singlesChampions: <HonourEntry>[].obs,
    HonourCategory.doublesChampions: <HonourEntry>[].obs,
    HonourCategory.hundreds180s: <HonourEntry>[].obs,
    HonourCategory.fifties180s: <HonourEntry>[].obs,
    HonourCategory.twenties171s: <HonourEntry>[].obs,
    HonourCategory.club170: <HonourEntry>[].obs,
  };

  @override
  void onInit() {
    super.onInit();
    fetchPresidents();
  }

  List<HonourEntry> get entries =>
      data[selectedCategory.value] ?? <HonourEntry>[];

  Future<void> fetchPresidents() async {
    final res = await http.get(
      Uri.parse('https://neda.club/BackEnd/services/api/presidents.php'),
    );

    if (res.statusCode != 200) return;

    final List decoded = json.decode(res.body);

    final mapped = decoded.map((e) {
      final int start = e['startYear'];
      final int end = e['endYear'];

      return HonourEntry(
        primary: e['name'],
        secondary: 'Club President',
        period: end == 0 ? '$start – Present' : '$start – $end',
      );
    }).toList();

    data[HonourCategory.presidents]!.assignAll(mapped);

    print('🟢 Presidents loaded: ${mapped.length}');
  }
}
