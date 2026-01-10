// ignore_for_file: deprecated_member_use

import 'package:neda_central/features/landing/model/poster.dart';
import 'package:share_plus/share_plus.dart';

class ShareHelper {
  static void sharePoster(Poster poster) {
    final buffer = StringBuffer();

    buffer.writeln(poster.title);

    if (poster.subtitle?.isNotEmpty == true) {
      buffer.writeln(poster.subtitle);
    }

    if (poster.content?.isNotEmpty == true) {
      buffer.writeln('\n${poster.content}');
    }

    buffer.writeln(
      '\nhttps://neda.club/BackEnd/posters/${poster.imageName}',
    );

    Share.share(buffer.toString());
  }
}
