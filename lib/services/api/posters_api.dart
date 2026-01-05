import '../../features/landing/model/poster.dart';
import '../http_client.dart';

class PostersApi {
  static Future<List<Poster>> fetch() async {
    final res = await HttpClient.get('/admin/posters.php');
    return (res as List).map((e) => Poster.fromJson(e)).toList();
  }
}
