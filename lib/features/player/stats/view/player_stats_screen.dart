import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../dashboard/widgets/stat_card.dart';
import '../../scoring/controller/scoring_controller.dart';

class PlayerStatsScreen extends StatelessWidget {
  const PlayerStatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ScoringController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Stats'),
      ),
      body: Obx(() {
        final stats = controller.stats;

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            GridView.count(
              crossAxisCount: MediaQuery.of(context).size.width > 700 ? 3 : 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                StatCard(
                  label: 'Games Played',
                  value: stats.gamesPlayed.toString(),
                  icon: FontAwesomeIcons.bullseye,
                ),
                StatCard(
                  label: 'Win %',
                  value: stats.winPercentage.toStringAsFixed(1),
                  icon: Icons.percent,
                ),
                StatCard(
                  label: 'Legs Won',
                  value: stats.legsWon.toString(),
                  icon: Icons.trending_up,
                ),
                StatCard(
                  label: 'Legs Lost',
                  value: stats.legsLost.toString(),
                  icon: Icons.trending_down,
                ),
                StatCard(
                  label: 'Highest Checkout',
                  value: stats.highestCheckout.toString(),
                  icon: Icons.flash_on,
                ),
                StatCard(
                  label: '180s',
                  value: stats.total180s.toString(),
                  icon: Icons.whatshot,
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
