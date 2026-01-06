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
    final dtos = await LifeMembersApi.fetchLifeMembers();

    lifeMembers.assignAll(
      dtos.map(
        (m) => LifeMemberEntry(
          name: m.name,
          year: m.inductionYear.toString(),
        ),
      ),
    );

    print('🟢 Life members loaded: ${lifeMembers.length}');
  }
}
