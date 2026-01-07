import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/neda_theme.dart';
import 'admin_life_members_controller.dart';

class AdminLifeMembersScreen extends StatelessWidget {
  const AdminLifeMembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;
    final controller = Get.put(AdminLifeMembersController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin · Life Members'),
        backgroundColor: n.surfaceCard,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.lifeMembers.isEmpty) {
          return const Center(child: Text('No life members found'));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: controller.lifeMembers.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (_, i) {
            final m = controller.lifeMembers[i];

            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: n.surfaceCard,
                borderRadius: BorderRadius.circular(14),
                boxShadow: n.shadowSoft,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      m.name,
                      style: NedaText.body(context)
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    m.inductionYear.toString(),
                    style: NedaText.muted(context),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
