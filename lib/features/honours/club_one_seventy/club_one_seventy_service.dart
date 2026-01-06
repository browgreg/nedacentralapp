import '../../../services/http_client.dart';
import 'club_one_seventy_entry.dart';

class ClubOneSeventyService {
  static Future<List<ClubOneSeventyEntry>> fetch() async {
    final res = await HttpClient.get('/services/api/one_seventy_club.php');

    if (res == null || res is! List) return [];

    return res
        .map((e) => ClubOneSeventyEntry.fromJson(
              Map<String, dynamic>.from(e),
            ))
        .toList();
  }
}
