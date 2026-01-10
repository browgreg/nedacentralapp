import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/admin_scaffold.dart';
import '../widgets/admin_life_member_form.dart';
import '../controller/admin_life_members_controller.dart';

class AdminLifeMembersScreen extends StatelessWidget {
  const AdminLifeMembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminLifeMembersController());

    return AdminScaffold(
      title: 'Life Members',
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => const AdminLifeMemberForm(),
            );
          },
        ),
      ],
      child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.lifeMembers.isEmpty) {
          return const Center(child: Text('No life members found'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.lifeMembers.length,
          itemBuilder: (_, i) {
            final m = controller.lifeMembers[i];

            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                title: Text(m.name),
                subtitle: Text('Inducted ${m.inductionYear}'),
                trailing: const Icon(Icons.lock_outline),
              ),
            );
          },
        );
      }),
    );
  }
}
