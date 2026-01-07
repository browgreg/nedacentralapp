import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../services/api/life_members_api.dart';
import 'life_members_entry.dart';

class LifeMembersController extends GetxController {
  final lifeMembers = <LifeMemberEntry>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadLifeMembers();
  }

  Future<void> loadLifeMembers() async {
    final entries = await LifeMembersApi.fetchLifeMembers();

    lifeMembers.assignAll(entries);

    if (kDebugMode) {
      print('🟢 Life members loaded: ${lifeMembers.length}');
    }
  }
}
