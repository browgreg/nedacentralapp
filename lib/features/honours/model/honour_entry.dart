class HonourEntry {
  final String primary; // Name / Team
  final String secondary; // Role / Description
  final String? period; // Year or term

  const HonourEntry({
    required this.primary,
    required this.secondary,
    this.period,
  });
}
