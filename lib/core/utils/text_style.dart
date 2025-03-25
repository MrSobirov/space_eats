import 'package:eats/core/extension/extension.dart';
import 'package:eats/core/utils/utils.dart';
import 'package:eats/router/app_routes.dart';

extension CustomTextStyle on TextTheme {
  TextStyle callOutMedium() => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "SF-Pro-Display",
    overflow: TextOverflow.ellipsis,
    color: parentNavigatorKey.currentContext!.appColors.textPrimary,
  );

  TextStyle callOutRegular() => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "SF-Pro-Display",
    overflow: TextOverflow.ellipsis,
    color: parentNavigatorKey.currentContext!.appColors.textPrimary,
  );

  TextStyle audioWide() => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Audiowide",
    overflow: TextOverflow.ellipsis,
    color: parentNavigatorKey.currentContext!.appColors.textPrimary,
  );

  TextStyle footnoteMedium() => TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "SF-Pro-Display",
    overflow: TextOverflow.ellipsis,
    color: parentNavigatorKey.currentContext!.appColors.textPrimary,
  );
}