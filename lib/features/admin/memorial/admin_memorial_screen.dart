import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/neda_theme.dart';
import 'admin_memorial_controller.dart';

class AdminMemorialScreen extends StatelessWidget {
  const AdminMemorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;
    final controller = Get.put(AdminMemorialController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin · In Memoriam'),
        backgroundColor: n.surfaceCard,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.memorials.isEmpty) {
          return const Center(child: Text('No memorial records'));
        }

        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 2.8,
          ),
          itemCount: controller.memorials.length,
          itemBuilder: (_, i) {
            final m = controller.memorials[i];

            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(14),
                boxShadow: n.shadowSoft,
              ),
              child: Text(
                m.name,
                textAlign: TextAlign.center,
                style: NedaText.body(context).copyWith(
                  color: Colors.amber.shade300,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
