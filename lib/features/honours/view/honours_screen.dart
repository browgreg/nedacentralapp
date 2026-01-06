import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controller/honours_controller.dart';
import '../widgets/honours_category_tabs.dart';
import '../widgets/honours_content.dart';

class HonoursScreen extends StatelessWidget {
  const HonoursScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HonoursController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Honours & Records')),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'lib/core/assets/wood.jpg',
                ),
                opacity: 0.8,
                fit: BoxFit.fill)),
        child: Column(
          children: [
            HonourCategoryTabs(controller: controller),
            const SizedBox(height: 12),
            Expanded(
              child: Obx(
                () => HonoursContent(
                  category: controller.selectedCategory.value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
