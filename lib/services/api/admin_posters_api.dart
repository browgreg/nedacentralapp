
import '../../features/admin/posters/model/poster_admin.dart';
import '../http_client.dart';

class AdminPostersApi {
  static Future<List<PosterAdmin>> fetchAll() async {
    final res = await HttpClient.get('/posters.php');

    if (res is! List) {
      throw Exception('Invalid admin posters response');
    }

    return res
        .map<PosterAdmin>((e) => PosterAdmin.fromJson(e))
        .toList();
  }

  static Future<void> delete(int id) async {
    await HttpClient.post(
      '/admin/delete_poster.php',
      body: {'id': id},
    );
  }

// create(), update() come later
}