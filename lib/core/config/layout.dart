import 'package:flutter/widgets.dart';

class AppLayout {
  /// Max readable width for content
  static const double maxContentWidth = 1200;

  /// Hero / story heights
  static double heroHeightFor(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    if (w >= 1200) return 520;
    if (w >= 900) return 460;
    if (w >= 600) return 380;
    return 300;
  }
}