import 'package:eats/core/extension/extension.dart';
import 'package:eats/core/utils/utils.dart';
import 'package:eats/core/widgets/buttons/submit_button.dart';
import 'package:eats/features/auth/presentation/widgets/input_view.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Text(
              "SpaceEats",
              style: context.textStyle.audioWide().copyWith(
                fontSize: 32.sp,
              ),
            ),
            48.verticalSpace,
            AuthInputView(),
            const Spacer(),
            SubmitButton("Войти", () {

            }),
            34.verticalSpace,
          ],
        ),
      ),
    );
  }
}
