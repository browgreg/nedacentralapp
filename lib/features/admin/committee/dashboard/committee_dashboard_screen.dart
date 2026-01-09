import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../dashboard/widgets/section_header.dart';
import '../../widgets/admin_scaffold.dart';
import '../controller/committee_controller.dart';
import '../model/committee_role.dart';
import '../view/committee_role_tile.dart';
import 'committee_assign_member_dialog.dart';

class CommitteeDashboardScreen extends StatelessWidget {
  const CommitteeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CommitteeController>();

    return AdminScaffold(
      title: 'Committee Dashboard',
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionHeader(title: 'Committee Roles'),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: CommitteeRole.values.map((role) {
                    return SizedBox(
                      width: 260,
                      child: CommitteeRoleTile(
                        role: role,
                        member: controller.members[role],
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => CommitteeAssignMemberDialog(
                              role: role,
                              existing: controller.members[role],
                            ),
                          );
                        },
                      ),
                    );
                  }).toList(),
                ),
              ],
            )),
      ),
    );
  }
}
