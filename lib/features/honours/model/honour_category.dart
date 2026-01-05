enum HonourCategory {
  presidents,
  lifeMembers,
  inMemoriam,
  teamChampions,
  singlesChampions,
  doublesChampions,
  oneHundred180s,
  fifty180s,
  twenty171s,
  club170s,
}

extension HonourCategoryX on HonourCategory {
  String get label {
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
      case HonourCategory.oneHundred180s:
        return "100 180's";
      case HonourCategory.fifty180s:
        return "50 180's";
      case HonourCategory.twenty171s:
        return "20 171's";
      case HonourCategory.club170s:
        return '170 Club';
    }
  }
}
