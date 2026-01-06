import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/neda_theme.dart';
import '../controller/honours_controller.dart';
import '../widgets/honours_category_tabs.dart';
import '../widgets/honours_content.dart';

class HonoursScreen extends StatelessWidget {
  const HonoursScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HonoursController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Honours & Records'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              nedaTeal,
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.black,
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 12),
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
