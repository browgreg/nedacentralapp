import '../http_client.dart';

class MemberLookupApi {
  static Future<String> lookupName(int rego) async {
    final res = await HttpClient.post(
      '/services/admin/member_lookup.php',
      body: {'rego': rego},
    );

    return res['name'].toString();
  }
}
