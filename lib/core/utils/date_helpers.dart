enum WeekLabel {
  thisWeek,
  nextWeek,
  upcoming,
}

DateTime startOfWeek(DateTime date) {
  final d = DateTime(date.year, date.month, date.day);
  return d.subtract(Duration(days: d.weekday - 1)); // Monday
}

WeekLabel weekLabelFor(DateTime date) {
  final target = DateTime(date.year, date.month, date.day);

  final now = DateTime.now();
  final thisWeek = startOfWeek(now);
  final nextWeek = thisWeek.add(const Duration(days: 7));
  final weekAfter = nextWeek.add(const Duration(days: 7));

  if (!target.isBefore(thisWeek) && target.isBefore(nextWeek)) {
    return WeekLabel.thisWeek;
  }

  if (!target.isBefore(nextWeek) && target.isBefore(weekAfter)) {
    return WeekLabel.nextWeek;
  }

  return WeekLabel.upcoming;
}
