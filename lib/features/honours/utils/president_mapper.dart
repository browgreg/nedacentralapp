import '../model/honour_entry.dart';
import '../model/president_model.dart';

List<HonourEntry> mapPresidentsToHonours(
  List<PresidentModel> presidents,
) {
  return presidents.map((p) {
    return HonourEntry(
      primary: p.name,
      secondary: 'Club President',
      period: p.term,
    );
  }).toList();
}
