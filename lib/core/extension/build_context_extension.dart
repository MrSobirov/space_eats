part of 'extension.dart';

extension BuildContextExt on BuildContext {
  Locale get locale => Localizations.localeOf(this);

  ThemeData get theme => Theme.of(this);

  ColorScheme get color => theme.colorScheme;

  bool get isDarkMode => theme.brightness == Brightness.dark;

  TextTheme get textStyle => theme.textTheme;

  ThemeColors get appColors => theme.extension<ThemeColors>()!;

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> Function(
      SnackBar snackBar,
      ) get showSnackBar => ScaffoldMessenger.of(this).showSnackBar;

  void fieldFocusChange(
      FocusNode? currentFocus,
      FocusNode? nextFocus,
      ) {
    if (currentFocus != null && nextFocus != null) {
      currentFocus.unfocus();
      FocusScope.of(this).requestFocus(nextFocus);
    }
  }
}
