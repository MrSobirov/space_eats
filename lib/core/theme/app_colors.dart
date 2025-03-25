part of 'themes.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.inActive,
    required this.lightText,
    required this.darkText,
    required this.backGround,
  });

  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color inActive;
  final Color lightText;
  final Color darkText;
  final Color backGround;

  static const ThemeColors light = ThemeColors(
    primary: Color(0xff34E1A2),
    secondary: Color(0xff4B33E1),
    tertiary: Color(0xff0D1E25),
    inActive: Color(0xffB1B1B1),
    lightText: Color(0xffF1F1F1),
    darkText: Color(0xff0D0D25),
    backGround: Color(0xffF9F9F9),
  );

  static const ThemeColors dark = ThemeColors(
    primary: Color(0xff34E1A2),
    secondary: Color(0xff4B33E1),
    tertiary: Color(0xff0D1E25),
    inActive: Color(0xffB1B1B1),
    lightText: Color(0xff22343F),
    darkText: Color(0xff0D0D25),
    backGround: Color(0xff0D1E25),
  );

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? inActive,
    Color? lightText,
    Color? darkText,
    Color? backGround,
  }) =>
      ThemeColors(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        tertiary: tertiary ?? this.tertiary,
        inActive: inActive ?? this.inActive,
        lightText: lightText ?? this.lightText,
        darkText: darkText ?? this.darkText,
        backGround: backGround ?? this.backGround,
      );

  @override
  ThemeExtension<ThemeColors> lerp(
      ThemeExtension<ThemeColors>? other, double t) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      inActive: Color.lerp(inActive, other.inActive, t)!,
      lightText: Color.lerp(lightText, other.lightText, t)!,
      darkText: Color.lerp(darkText, other.darkText, t)!,
      backGround: Color.lerp(backGround, other.backGround, t)!,
    );
  }
}
