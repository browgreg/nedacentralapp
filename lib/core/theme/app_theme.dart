import 'package:flutter/material.dart';
import 'neda_theme.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,

      extensions: const [
        NedaTheme(
          textPrimary: Colors.white,
          textMuted: Colors.white70,

          accentPrimary: Color(0xFFD4AF37),
          accentSuccess: Colors.green,
          accentError: Colors.red,
          accentWarning: Colors.orange,
          accentHeader: Color(0xFF1F2937),

          surfaceCard: Color(0xFF111827),
          surfaceSubtle: Color(0xFF1F2937),
          borderPrimary: Color(0xFF374151),

          shadowSoft: [
            BoxShadow(
              color: Color(0x22000000),
              blurRadius: 18,
              offset: Offset(0, 10),
            ),
          ],
        ),
      ],
    );
  }
}