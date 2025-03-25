import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../features/settings/presentation/widgets/custom_switch_widget.dart';
import 'theme_provider.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        final bool isDark = themeProvider.themeMode == ThemeMode.dark;
        return CustomSwitch(
          value: isDark,
          onChanged: (value) {
            themeProvider.toggleTheme(!isDark);
          },
          activeIcon: Icons.dark_mode_outlined,
        );
      },
    );
  }


}
