import 'package:flutter/material.dart';
import 'package:neda_central/features/honours/team_champions/teams_champions_list.dart';

import '../club_one_seventy/club_one_seventy_list.dart';
import '../doubles_champions/doubles_champions_list.dart';
import '../fifty_one_eighties/fifty_one_eight_list.dart';
import '../life_members/life_members_list.dart';
import '../memorial/memorial_list.dart';
import '../model/honour_category.dart';
import '../one_hundred_one_eighties/hundred_one_eighties_list.dart';
import '../presidents/presidents_list.dart';
import '../singles_champions/singles_champions_list.dart';
import '../ten_one_seventy_ones/ten_one_seventy_ones_list.dart';

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
        return const TeamsChampionsList();
      case HonourCategory.singlesChampions:
        return const SinglesChampionsList();

      case HonourCategory.doublesChampions:
        return const DoublesChampionsList();
      case HonourCategory.fifties180s:
        return const FiftyOneEightiesList();
      case HonourCategory.hundreds180s:
        return const HundredOneEightiesList();
      case HonourCategory.twenties171s:
        return const TenOneSeventyOnesList();
      case HonourCategory.club170:
        return const ClubOneSeventyList();
    }
  }
}
