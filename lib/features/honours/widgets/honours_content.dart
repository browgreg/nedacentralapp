import 'package:flutter/material.dart';

import '../club_one_seventy/one_seventy_one_list.dart';
import '../doubles_champions/doubles_list.dart';
import '../fifty_one_eighties/fifty_one_eight_list.dart';
import '../life_members/life_members_list.dart';
import '../memorial/memorial_list.dart';
import '../model/honour_category.dart';
import '../one_hundred_one_eighties/hundred_one_eighties_list.dart';
import '../presidents/presidents_list.dart';
import '../singles_champions/singles_champions_list.dart';
import '../team_champions/team_champion_list.dart';
import '../twenty_one_seventy_ones/twenty_one_seventy_ones_list.dart';

class HonoursContent extends StatelessWidget {
  final HonourCategory category;

  const HonoursContent({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    switch (category) {
      case HonourCategory.presidents:
        return const PresidentsList();

      case HonourCategory.lifeMembers:
        return const LifeMembersList();

      case HonourCategory.inMemoriam:
        return const MemorialList();
      case HonourCategory.teamChampions:
        return const TeamChampionsList();
      case HonourCategory.singlesChampions:
        return const SinglesChampionsList();

      case HonourCategory.doublesChampions:
        return const DoublesChampionsList();
      case HonourCategory.fifties180s:
        return const FiftyOneEightList();
      case HonourCategory.hundreds180s:
        return const HundredOneEightiesList();
      case HonourCategory.twenties171s:
        return const TwentyOneSeventyOnesList();
      case HonourCategory.club170:
        return const ClubOneSeventyList();
      default:
        return const Center(
          child: Text('Section coming soon'),
        );
    }
  }
}
