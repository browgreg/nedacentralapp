import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/brass_plaque_tile.dart';
import 'life_members_controller.dart';

class LifeMembersList extends StatelessWidget {
  const LifeMembersList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LifeMembersController());

    return Obx(() {
      if (controller.lifeMembers.isEmpty) {
        return const Center(
          child: Text('No life members recorded'),
        );
      }

      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.lifeMembers.length,
        itemBuilder: (_, i) {
          final m = controller.lifeMembers[i];

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: BrassPlaqueTile(
              primary: m.name,
              secondary: 'Inducted ${m.year}',
            ),
          );
        },
      );
    });
  }
}
