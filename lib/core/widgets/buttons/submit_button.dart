import 'package:eats/core/extension/extension.dart';
import 'package:eats/core/utils/text_style.dart';
import 'package:eats/core/utils/utils.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const SubmitButton(this.text, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: context.appColors.primary,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          text,
          style: context.textStyle.callOutMedium().copyWith(),
        ),
      ),
    );
  }
}
