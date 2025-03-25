import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../injector_container.dart';
import '../local_storage/local_keys.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode =
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light;

  ThemeProvider() {
    _loadTheme();
  }

  ThemeMode get themeMode => _themeMode;

  void toggleTheme(bool isDarkMode) async {
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
    hiveBox.put(LocalKeys.isDarkMode, isDarkMode);
  }

  void _loadTheme() async {
    final bool isDarkMode = await hiveBox.get(LocalKeys.isDarkMode) ?? true;
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
