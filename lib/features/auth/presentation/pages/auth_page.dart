import 'package:eats/core/extension/extension.dart';
import 'package:eats/core/utils/utils.dart';
import 'package:eats/core/widgets/buttons/submit_button.dart';
import 'package:eats/features/auth/presentation/bloc/auth_bloc.dart';

import '../../../../core/widgets/inputs/input_formatters.dart';
import '../../../../core/widgets/inputs/text_field.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
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
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState state) {},
      builder: (BuildContext context, AuthState state) {
        final AuthBloc authBloc = context.read<AuthBloc>();
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
                Align(
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
                ),
                const Spacer(),
                SubmitButton("Войти", () {
                  authBloc.add(LoginEvent(
                    phone: phoneController.text,
                    password: passwordController.text,
                    context: context,
                  ));
                }),
                34.verticalSpace,
              ],
            ),
          ),
        );
      },
    );
  }
}
