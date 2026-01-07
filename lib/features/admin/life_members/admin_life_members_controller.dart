import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../services/api/life_members_api.dart';
import '../../honours/life_members/life_member_dto.dart';
import 'admin_life_member_entry.dart';

class AdminLifeMembersController extends GetxController {
  final lifeMembers = <AdminLifeMemberEntry>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadLifeMembers();
  }

  Future<void> loadLifeMembers() async {
    try {
      isLoading.value = true;

      final List<LifeMemberDto> res = await LifeMembersApi.fetchLifeMembers();

      lifeMembers.assignAll(
        res.map(
          (m) => AdminLifeMemberEntry(
            id: m.id,
            name: m.name,
            inductionYear: m.inductionYear,
          ),
        ),
      );

      debugPrint('🟢 Admin life members loaded: ${lifeMembers.length}');
    } catch (e, s) {
      debugPrint('🔴 Failed to load life members: $e');
      debugPrintStack(stackTrace: s);
    } finally {
      isLoading.value = false;
    }
  }
}
