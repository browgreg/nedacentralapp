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

class HonourCategories {
  static const List<HonourCategory> ordered = [
    HonourCategory.presidents,
    HonourCategory.lifeMembers,
    HonourCategory.inMemoriam,
    HonourCategory.teamChampions,
    HonourCategory.singlesChampions,
    HonourCategory.doublesChampions,
    HonourCategory.hundreds180s,
    HonourCategory.fifties180s,
    HonourCategory.twenties171s,
    HonourCategory.club170,
  ];
}

extension HonourCategoryX on HonourCategory {
  /// Display title (used in tabs + headers)
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

      case HonourCategory.fifties180s:
        return '50+ 180';
      case HonourCategory.hundreds180s:
        return '100+ 180s';
      case HonourCategory.twenties171s:
        return '10+ 171';
      case HonourCategory.club170:
        return 'Club 170';
    }
  }

  /// Used if you ever want stable keys / analytics
  String get key {
    return name;
  }
}
