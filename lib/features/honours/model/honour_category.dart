enum HonourCategory {
  presidents,
  lifeMembers,
  inMemoriam,
  teamChampions,
  singlesChampions,
  doublesChampions,
  hundreds180s,
  fifties180s,
  twenties171s,
  club170,
}

extension HonourCategoryX on HonourCategory {
  String get title {
    switch (this) {
      case HonourCategory.presidents:
        return 'Presidents';
      case HonourCategory.lifeMembers:
        return 'Life Members';
      case HonourCategory.inMemoriam:
        return 'In Memoriam';
      case HonourCategory.teamChampions:
        return 'Team Champions';
      case HonourCategory.singlesChampions:
        return 'Singles Champions';
      case HonourCategory.doublesChampions:
        return 'Doubles Champions';
      case HonourCategory.hundreds180s:
        return '100 180s';
      case HonourCategory.fifties180s:
        return '50 180s';
      case HonourCategory.twenties171s:
        return '20 171s';
      case HonourCategory.club170:
        return '170 Club';
    }
  }
}
