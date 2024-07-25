import 'package:flutter/widgets.dart';

extension YinYang on Color {
  bool get isLight => (0.299 * red) + (0.587 * green) + (0.114 * blue) > 128;

  bool get isDark => !isLight;

  Color getYinYangColor(Color ifBlack, Color ifWhite) => isLight ? ifBlack : ifWhite;

  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
