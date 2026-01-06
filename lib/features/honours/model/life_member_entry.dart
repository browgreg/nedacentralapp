class LifeMemberEntry {
  final String name;
  final int inductionYear;

  const LifeMemberEntry({
    required this.name,
    required this.inductionYear,
  });

  String get subtitle => 'Life Member';

  String get period => 'Inducted $inductionYear';
}
