import 'package:url_launcher/url_launcher.dart';

class MapLauncher {
  static Future<void> open(String query) async{
    final uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(query)}',
    );

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch maps');
    }
  }
}