import 'package:eats/core/extension/extension.dart';
import 'package:eats/core/utils/utils.dart';

import '../../../../core/widgets/inputs/input_formatters.dart';
import '../../../../core/widgets/inputs/text_field.dart';

class AuthInputView extends StatefulWidget {
  const AuthInputView({super.key});

  @override
  State<AuthInputView> createState() => _AuthInputViewState();
}

class _AuthInputViewState extends State<AuthInputView> {
  late final TextEditingController phoneController;
  late final TextEditingController passwordController;
  late final FocusNode phoneFocusNode;
  late final FocusNode passwordFocusNode;

  @override
  void initState() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    phoneFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Номер телефона или логин",
            style: context.textStyle.footnoteMedium(),
          ),
          CustomTextField(
            phoneController,
            focusNode: phoneFocusNode,
            inputType: TextInputType.phone,
            formatters: [InputMasks.phoneMask2Formatter],
            hint: "Введите телефон или логин",
          ),
          10.verticalSpace,
          Text(
            "Пароль",
            style: context.textStyle.footnoteMedium(),
          ),
          CustomTextField(
            passwordController,
            focusNode: passwordFocusNode,
            secureText: true,
            hint: "Введите пароль",
          ),
        ],
      ),
    );
  }
}
