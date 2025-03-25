import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/theme_provider.dart';
import 'injector_container.dart' as  di;

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await di.init();
  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('uz', 'UZ'),
        Locale('en', 'US'),
        Locale('ru', 'RU'),
      ],
      startLocale: Locale('uz', 'UZ'),
      path: 'assets/translations',
      child: ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: const App(),
      ),
    ),
  );
}