import 'package:eats/core/extension/extension.dart';
import 'package:eats/core/utils/utils.dart';
import 'package:eats/core/widgets/buttons/submit_button.dart';
import 'package:eats/router/app_routes.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          children: [
            52.verticalSpace,
            Text(
              "Возможности нашего приложения",
              style: context.textStyle.audioWide().copyWith(
                color: context.appColors.black,
              ),
            ),
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
              children: [1, 2, 3].map((item) => Container(
                height: 76.h,
                margin: EdgeInsets.symmetric(vertical: 14.h),
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 13.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: context.appColors.backSecondary,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      ImagesPath.welcome,
                    ),
                    16.horizontalSpace,
                    Text(
                      "Заказывайте еду",
                      style: context.textStyle.callOutMedium(),
                    )
                  ],
                ),
              )).toList(),
            ),
            const Spacer(),
            SubmitButton("Продолжить", () {
              context.go(Routes.auth);
            }),
            34.verticalSpace,
          ],
        ),
      ),
    );
  }
}
