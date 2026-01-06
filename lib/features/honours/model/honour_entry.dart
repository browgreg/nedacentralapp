class HonourEntry {
  final String primary;
  final String secondary;
  final String? period;

  const HonourEntry({
    required this.primary,
    required this.secondary,
    this.period,
  });
}
