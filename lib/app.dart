import 'package:eats/router/app_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import 'core/utils/utils.dart';
import 'core/theme/theme_provider.dart';
import 'core/theme/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return ScreenUtilInit(
          designSize: const Size(393, 852),
          minTextAdapt: true,
          useInheritedMediaQuery: true,
          splitScreenMode: true,
          builder: (BuildContext context, Widget? child) {
            return MaterialApp.router(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              routerConfig: AppRoutes.router,
              title: 'SpaceEats',
              debugShowCheckedModeBanner: false,
              themeMode: themeProvider.themeMode,
              theme: lightTheme,
              darkTheme: darkTheme,
            );
          },
        );
      },
    );
  }
}
