import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../services/api/life_members_api.dart';
import '../../honours/life_members/life_members_entry.dart';

class AdminLifeMembersController extends GetxController {
  final lifeMembers = <LifeMemberEntry>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadLifeMembers();
  }

  Future<void> loadLifeMembers() async {
    try {
      isLoading.value = true;

      final data = await LifeMembersApi.fetchLifeMembers();
      lifeMembers.assignAll(data);

      debugPrint('🟢 Admin Life Members loaded: ${data.length}');
    } catch (e) {
      debugPrint('🔴 Failed to load life members: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
