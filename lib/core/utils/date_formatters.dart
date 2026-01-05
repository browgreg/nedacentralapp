import 'package:intl/intl.dart';

class DateFormatters {
  static String posterRange(DateTime start, DateTime? end) {
    final startFmt = DateFormat('d MMM yyyy');

    if (end == null || start.isAtSameMomentAs(end)) {
      return startFmt.format(start);
    }

    if (start.year == end.year && start.month == end.month) {
      return '${start.day}–${end.day} ${DateFormat('MMM yyyy').format(end)}';
    }

    return '${startFmt.format(start)} – ${startFmt.format(end)}';
  }
}