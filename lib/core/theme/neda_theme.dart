import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// ───────────────────────────
/// NEDA THEME EXTENSION
/// ───────────────────────────

@immutable
class NedaTheme extends ThemeExtension<NedaTheme> {
  final Color textPrimary;
  final Color textMuted;

  final Color accentPrimary;
  final Color accentSuccess;
  final Color accentError;
  final Color accentWarning;
  final Color accentHeader;

  final Color surfaceCard;
  final Color surfaceSubtle;

  final Color borderPrimary;

  /// 🆕 Soft elevation shadow (newspaper / cards)
  final List<BoxShadow> shadowSoft;

  const NedaTheme({
    required this.textPrimary,
    required this.textMuted,
    required this.accentPrimary,
    required this.accentSuccess,
    required this.accentHeader,
    required this.accentError,
    required this.accentWarning,
    required this.surfaceCard,
    required this.surfaceSubtle,
    required this.borderPrimary,
    required this.shadowSoft,
  });

  @override
  NedaTheme copyWith({
    Color? textPrimary,
    Color? textMuted,
    Color? accentPrimary,
    Color? accentSuccess,
    Color? accentError,
    Color? accentHeader,
    Color? accentWarning,
    Color? surfaceCard,
    Color? surfaceSubtle,
    Color? borderPrimary,
    List<BoxShadow>? shadowSoft,
  }) {
    return NedaTheme(
      textPrimary: textPrimary ?? this.textPrimary,
      textMuted: textMuted ?? this.textMuted,
      accentPrimary: accentPrimary ?? this.accentPrimary,
      accentSuccess: accentSuccess ?? this.accentSuccess,
      accentError: accentError ?? this.accentError,
      accentHeader: accentHeader ?? this.accentHeader,
      accentWarning: accentWarning ?? this.accentWarning,
      surfaceCard: surfaceCard ?? this.surfaceCard,
      surfaceSubtle: surfaceSubtle ?? this.surfaceSubtle,
      borderPrimary: borderPrimary ?? this.borderPrimary,
      shadowSoft: shadowSoft ?? this.shadowSoft,
    );
  }

  @override
  NedaTheme lerp(ThemeExtension<NedaTheme>? other, double t) {
    if (other is! NedaTheme) return this;
    return NedaTheme(
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      accentPrimary: Color.lerp(accentPrimary, other.accentPrimary, t)!,
      accentSuccess: Color.lerp(accentSuccess, other.accentSuccess, t)!,
      accentHeader: Color.lerp(accentHeader, other.accentHeader, t)!,
      accentError: Color.lerp(accentError, other.accentError, t)!,
      accentWarning: Color.lerp(accentWarning, other.accentWarning, t)!,
      surfaceCard: Color.lerp(surfaceCard, other.surfaceCard, t)!,
      surfaceSubtle: Color.lerp(surfaceSubtle, other.surfaceSubtle, t)!,
      borderPrimary: Color.lerp(borderPrimary, other.borderPrimary, t)!,
      shadowSoft: BoxShadow.lerpList(shadowSoft, other.shadowSoft, t)!,
    );
  }
}

/// ───────────────────────────
/// NEDA SPACING TOKENS
/// ───────────────────────────
class NedaSpace {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;

  static SizedBox vXs() => const SizedBox(height: xs);

  static SizedBox vSm() => const SizedBox(height: sm);

  static SizedBox vMd() => const SizedBox(height: md);

  static SizedBox vLg() => const SizedBox(height: lg);

  static SizedBox vXl() => const SizedBox(height: xl);

  static SizedBox hXs() => const SizedBox(width: xs);

  static SizedBox hSm() => const SizedBox(width: sm);

  static SizedBox hMd() => const SizedBox(width: md);

  static SizedBox hLg() => const SizedBox(width: lg);

  static SizedBox hXl() => const SizedBox(width: xl);

  static EdgeInsets allSm() => const EdgeInsets.all(sm);

  static EdgeInsets allMd() => const EdgeInsets.all(md);

  static EdgeInsets allLg() => const EdgeInsets.all(lg);

  static EdgeInsets sym({double h = 0, double v = 0}) =>
      EdgeInsets.symmetric(horizontal: h, vertical: v);
}

/// ───────────────────────────
/// NEDA SURFACES
/// ───────────────────────────
class NedaSurface {
  static BoxDecoration card(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return BoxDecoration(
        color: n.surfaceCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: n.borderPrimary.withAlpha(120),
        ),
        boxShadow: [
          BoxShadow(color: Colors.white, offset: Offset(4, 4), blurRadius: 5),
          BoxShadow(
              color: Colors.white, offset: Offset(3.5, 3.5), blurRadius: 4),
          BoxShadow(color: Colors.white, offset: Offset(3, 3), blurRadius: 3),
          BoxShadow(
              color: Colors.white, offset: Offset(2.5, 2.5), blurRadius: 2),
          BoxShadow(color: Colors.white, offset: Offset(2, 2), blurRadius: 1),
          BoxShadow(
              color: Colors.white, offset: Offset(1.5, 1.5), blurRadius: 0),
          BoxShadow(color: Colors.white, offset: Offset(1, 1), blurRadius: 0),
          BoxShadow(color: Colors.white, offset: Offset(.5, .5), blurRadius: 0),
        ] // ✅ THIS is the key
        );
  }

  static BoxDecoration subtle(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;
    return BoxDecoration(
        color: n.surfaceSubtle,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color(0x22FFFFFF),
            blurRadius: 18,
            spreadRadius: -8,
            offset: Offset(0, 12),
          ),
        ]);
  }
}

/// ───────────────────────────
/// NEDA DIVIDERS
/// ───────────────────────────
class NedaDivider {
  static Divider subtle(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;
    return Divider(
      color: n.borderPrimary.withAlpha(80),
      thickness: 1,
      height: 20,
    );
  }
}

/// ───────────────────────────
/// NEDA BORDERS
/// ───────────────────────────
class NedaBorder {
  static Border standard(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;
    return Border.all(color: n.borderPrimary.withAlpha(140), width: 1.5);
  }
}

/// ───────────────────────────
/// NEDA ICON HELPERS
/// ───────────────────────────
class NedaIcon {
  static Icon accent(BuildContext context, IconData icon, {double size = 20}) {
    final n = Theme.of(context).extension<NedaTheme>()!;
    return Icon(icon, size: size, color: n.accentPrimary);
  }

  static Icon warning(BuildContext context, IconData icon, {double size = 20}) {
    final n = Theme.of(context).extension<NedaTheme>()!;
    return Icon(icon, size: size, color: n.accentWarning);
  }
}

class NedaText {
  static TextStyle heading(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;
    return GoogleFonts.labrada(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: n.textPrimary,
    );
  }

  static TextStyle headingSmall(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;
    return GoogleFonts.labrada(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: n.textPrimary,
    );
  }

  static TextStyle muted(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;
    return TextStyle(fontSize: 14, color: n.textMuted);
  }

  static TextStyle body(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;
    return TextStyle(fontSize: 15, height: 1.4, color: n.textPrimary);
  }

  static TextStyle headingUnderline(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;
    return TextStyle(
      decoration: TextDecoration.underline,
      fontSize: 15,
      height: 1.4,
      color: n.textPrimary,
    );
  }

  static TextStyle caption(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;
    return TextStyle(
      fontSize: 13,
      color: n.textMuted,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle smallPrint(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;
    return GoogleFonts.averageSans(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: n.textPrimary,
    );
  }

  static TextStyle accent(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;
    return GoogleFonts.labrada(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: n.accentPrimary,
    );
  }

  static TextStyle link(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: n.accentPrimary,
      decoration: TextDecoration.underline,
      decorationColor: n.accentPrimary,
    );
  }

  static TextStyle success(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;
    return TextStyle(fontWeight: FontWeight.bold, color: n.accentSuccess);
  }

  static TextStyle error(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;
    return TextStyle(fontWeight: FontWeight.bold, color: n.accentError);
  }
}

BoxDecoration nedaCardWhiteShadow() {
  return BoxDecoration(
    color: nedaGameCard, // ✅ NEDA card surface
    borderRadius: BorderRadius.circular(20),
    boxShadow: boxShadowWhite(), // optional but recommended
  );
}

List<BoxShadow> boxShadowWhite() {
  return [
    BoxShadow(color: Colors.white, offset: Offset(7, 7), blurRadius: 0),
    BoxShadow(color: Colors.white, offset: Offset(6.5, 6.5), blurRadius: 0),
    BoxShadow(color: Colors.white, offset: Offset(6, 6), blurRadius: 0),
    BoxShadow(color: Colors.white, offset: Offset(5.5, 5.5), blurRadius: 0),
    BoxShadow(color: Colors.white, offset: Offset(5, 5), blurRadius: 0),
    BoxShadow(color: Colors.white, offset: Offset(4.5, 4.5), blurRadius: 0),
    BoxShadow(color: Colors.white, offset: Offset(4, 4), blurRadius: 0),
    BoxShadow(color: Colors.white, offset: Offset(3.5, 3.5), blurRadius: 0),
    BoxShadow(color: Colors.white, offset: Offset(3, 3), blurRadius: 0),
    BoxShadow(color: Colors.white, offset: Offset(2.5, 2.5), blurRadius: 0),
    BoxShadow(color: Colors.white, offset: Offset(2, 2), blurRadius: 0),
    BoxShadow(color: Colors.white, offset: Offset(1.5, 1.5), blurRadius: 0),
    BoxShadow(color: Colors.white, offset: Offset(1, 1), blurRadius: 0),
    BoxShadow(color: Colors.white, offset: Offset(.5, .5), blurRadius: 0),
  ];
}

List<BoxShadow> boxShadowBrass() {
  return [
    BoxShadow(color: brassDark, offset: Offset(7, 7), blurRadius: 0),
    BoxShadow(color: brassDark, offset: Offset(6.5, 6.5), blurRadius: 0),
    BoxShadow(color: brassDark, offset: Offset(6, 6), blurRadius: 0),
    BoxShadow(color: brassBase, offset: Offset(5.5, 5.5), blurRadius: 0),
    BoxShadow(color: brassBase, offset: Offset(5, 5), blurRadius: 0),
    BoxShadow(color: brassBase, offset: Offset(4.5, 4.5), blurRadius: 0),
    BoxShadow(color: brassBase, offset: Offset(4, 4), blurRadius: 0),
    BoxShadow(color: brassBase, offset: Offset(3.5, 3.5), blurRadius: 0),
    BoxShadow(color: brassBase, offset: Offset(3, 3), blurRadius: 0),
    BoxShadow(color: brassBase, offset: Offset(2.5, 2.5), blurRadius: 0),
    BoxShadow(color: brassBase, offset: Offset(2, 2), blurRadius: 0),
    BoxShadow(color: brassBase, offset: Offset(1.5, 1.5), blurRadius: 0),
    BoxShadow(color: brassBase, offset: Offset(1, 1), blurRadius: 0),
    BoxShadow(color: brassBase, offset: Offset(.5, .5), blurRadius: 0),
  ];
}

Color nedaYellow = const Color(0xfffffb16);
Color nedaDarkGreen = const Color(0xff006636);
Color nedaTeal = const Color(0xff83D0EA);
Color nedaEnter = const Color(0xff020e97);
Color nedaWhite = const Color(0xffffffff);
Color nedaBlack = const Color(0xff000000);
Color nedaRed = const Color(0xffDF4641);
Color nedaGreen = const Color(0xff00ff37);
Color nedaSilver = const Color(0xffC0C0C0);
Color nedaGold = const Color(0xffedce2a);
Color nedaBronze = const Color(0xffCD7F32);
Color nedaBrass = const Color(0xffc49502);
Color screenOuter = const Color(0xff232323);
Color screenMSOuter = const Color(0xffeff0f4);
Color screenCapsule = const Color(0xffF7F6F5);
Color nedaForm = const Color(0xff979595);
Color nedaLadderA = const Color(0xffccccca);
Color nedaLadderB = const Color(0xffF2F2F2);
Color nedaGameCard = const Color(0xff112921);
Color nedaGameCardDark = const Color(0xff0d2019);
Color nedaGoldWriting = const Color(0xfff9ab20);
Color nedaPersonalAccount = const Color(0xff0574E5);
const brassBase = Color(0xFFB08D57);
const brassLight = Color(0xFFD6B98C);
const brassDark = Color(0xFF7A5A2E);

BoxDecoration brassTileBoxDecoration() {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(14),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFD6B98C), // highlight
          Color(0xFFB08D57), // brass base
          Color(0xFF7A5A2E), // shadow
        ],
      ),
      boxShadow: boxShadowBrass());
}
