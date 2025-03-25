part of 'themes.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  final Color primary;
  final Color backGround;
  final Color black;
  final Color backSecondary;
  final Color bgSecondary;
  final Color borderPrimary;

  final Color textPrimary;
  final Color textSecondary;
  final Color textDisabled;

  const ThemeColors({
    required this.primary,
    required this.backGround,
    required this.black,
    required this.backSecondary,
    required this.bgSecondary,
    required this.borderPrimary,

    required this.textPrimary,
    required this.textSecondary,
    required this.textDisabled,
  });

  static const ThemeColors light = ThemeColors(
    primary: Color.fromRGBO(10, 186, 181, 1),
    backGround: Color.fromRGBO(240, 240, 245, 1),
    textPrimary: Color.fromRGBO(25, 25, 30, 1),
    backSecondary: Color.fromRGBO(0, 0, 0, 0.05),
    black: Color.fromRGBO(0, 0, 0, 1),
    bgSecondary: Color.fromRGBO(235, 238, 245, 1),
    borderPrimary: Color.fromRGBO(200, 205, 215, 1),
    textDisabled: Color.fromRGBO(180, 183, 190, 1),
    textSecondary: Color.fromRGBO(90, 92, 100, 1),
  );

  static const ThemeColors dark = ThemeColors(
    primary: Color.fromRGBO(10, 186, 181, 1),
    backGround: Color.fromRGBO(12, 17, 29, 1),
    textPrimary: Color.fromRGBO(245, 245, 246, 1),
    backSecondary: Color.fromRGBO(255, 255, 255, 0.1),
    black: Color.fromRGBO(255, 255, 255, 1),
    bgSecondary: Color.fromRGBO(22, 27, 38, 1),
    borderPrimary: Color.fromRGBO(51, 55, 65, 1),
    textDisabled: Color.fromRGBO(133, 136, 142, 1),
    textSecondary: Color.fromRGBO(206, 207, 210, 1),
  );

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? primary,
    Color? backGround,
    Color? textPrimary,
    Color? backSecondary,
    Color? black,
    Color? bgSecondary,
    Color? borderPrimary,
    Color? textDisabled,
    Color? textSecondary,
  }) =>
      ThemeColors(
        primary: primary ?? this.primary,
        backGround: backGround ?? this.backGround,
        textPrimary: textPrimary ?? this.textPrimary,
        backSecondary: backSecondary ?? this.backSecondary,
        black: black ?? this.black,
        bgSecondary: bgSecondary ?? this.bgSecondary,
        borderPrimary: borderPrimary ?? this.borderPrimary,
        textDisabled: textDisabled ?? this.textDisabled,
        textSecondary: textSecondary ?? this.textSecondary,
      );

  @override
  ThemeExtension<ThemeColors> lerp(
      ThemeExtension<ThemeColors>? other, double t) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      primary: Color.lerp(primary, other.primary, t)!,
      backGround: Color.lerp(backGround, other.backGround, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      backSecondary: Color.lerp(backSecondary, other.backSecondary, t)!,
      black: Color.lerp(black, other.black, t)!,
      bgSecondary: Color.lerp(bgSecondary, other.bgSecondary, t)!,
      borderPrimary: Color.lerp(borderPrimary, other.borderPrimary, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
    );
  }
}
