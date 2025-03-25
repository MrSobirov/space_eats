part of 'themes.dart';

final brightness = PlatformDispatcher.instance.platformBrightness;

// Define a method to create color schemes from seed color and brightness
ColorScheme createColorScheme(Brightness brightness) {
  return ColorScheme.fromSeed(
    seedColor: const Color(0xff0ABAB5),
    brightness: brightness,
  );
}

final ThemeData baseTheme = ThemeData(
  useMaterial3: true,
  colorScheme: createColorScheme(brightness),
  brightness: brightness,
  applyElevationOverlayColor: true,
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
    },
  ),
  splashFactory:
      Platform.isAndroid ? InkRipple.splashFactory : InkSparkle.splashFactory,
  visualDensity: VisualDensity.standard,
  materialTapTargetSize: MaterialTapTargetSize.padded,
  textTheme: GoogleFonts.notoSansTextTheme(),
);

// Helper method to create themes
ThemeData createTheme(Brightness brightness) {
  final colorScheme = createColorScheme(brightness);
  final appTheme = baseTheme.copyWith(colorScheme: colorScheme);
  final appColors = brightness == Brightness.light ? ThemeColors.light : ThemeColors.dark;

  return appTheme.copyWith(
    colorScheme: colorScheme,
    extensions: <ThemeExtension<dynamic>>[
      brightness == Brightness.light ? ThemeColors.light : ThemeColors.dark,
    ],
    scaffoldBackgroundColor: appColors.backGround,
    dividerTheme: DividerThemeData(
      thickness: 0.6,
      indent: 0,
      space: 0,
      color: appTheme.colorScheme.surfaceContainerHigh,
    ),
    dialogTheme: const DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
    scrollbarTheme: ScrollbarThemeData(
      thickness: WidgetStateProperty.all(5),
      minThumbLength: 100,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      elevation: 1,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.resolveWith(
          (states) => Colors.white,
        ),
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return Colors.grey;
            }
            return appTheme.colorScheme.primary;
          },
        ),
        elevation: const WidgetStatePropertyAll(0),
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        fixedSize: const WidgetStatePropertyAll(Size(double.infinity, 48)),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(),
    bottomSheetTheme: BottomSheetThemeData(
      modalBarrierColor: appTheme.colorScheme.onPrimaryContainer.withValues(alpha: 0.15),
      constraints: const BoxConstraints(maxWidth: double.maxFinite),
      backgroundColor: appTheme.colorScheme.surfaceContainerHigh,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        backgroundColor: appTheme.colorScheme.surfaceContainerLowest),
    tabBarTheme: TabBarTheme(
      indicatorColor: appTheme.colorScheme.primary,
      dividerColor: Colors.transparent,
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      labelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 2.5,
          color: appTheme.colorScheme.primary,
        ),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      elevation: 0,
      height: kToolbarHeight,
      iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
        (states) => const IconThemeData(),
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
         systemNavigationBarColor: Colors.transparent,
        statusBarBrightness:
            brightness == Brightness.dark ? Brightness.dark : Brightness.light,
        statusBarIconBrightness:
            brightness == Brightness.dark ? Brightness.light : Brightness.dark,
        systemNavigationBarIconBrightness:
            brightness == Brightness.dark ? Brightness.light : Brightness.dark,
      ),
      iconTheme: IconThemeData(color: appTheme.colorScheme.secondary),
      titleTextStyle: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
        color: appColors.textPrimary,
      ),
      toolbarTextStyle: appTheme.textTheme.titleLarge!
          .copyWith(color: appTheme.colorScheme.secondary, fontSize: 14),
      backgroundColor: appColors.backGround,
    ),
    checkboxTheme: CheckboxThemeData(
      side: BorderSide(color: appTheme.colorScheme.primary),
    ),
  );
}

final ThemeData lightTheme = createTheme(Brightness.light);
final ThemeData darkTheme = createTheme(Brightness.dark);
