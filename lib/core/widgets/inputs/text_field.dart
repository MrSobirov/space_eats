import 'package:eats/core/extension/extension.dart';
import 'package:eats/core/utils/utils.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String hint;
  final bool secureText;
  final TextInputType inputType;
  final List<TextInputFormatter> formatters;

  const CustomTextField(this.controller,
      {this.focusNode,
        this.hint = "",
        this.secureText = false,
        this.inputType = TextInputType.text,
        this.formatters = const [],
        super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  @override
  void initState() {
    if(widget.focusNode != null) {
      widget.focusNode!.addListener(() {
        setState(() {});
      });
    }
    isObscure = widget.secureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      margin: EdgeInsets.symmetric(vertical: 6.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: context.appColors.bgSecondary,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: widget.focusNode?.hasFocus ?? false
              ? context.appColors.primary
              : context.appColors.borderPrimary,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.controller,
              focusNode: widget.focusNode,
              obscureText: isObscure,
              keyboardType: widget.inputType,
              inputFormatters: widget.formatters,
              style: context.textStyle.callOutMedium().copyWith(
                color: context.appColors.black,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hint,
                hintStyle: context.textStyle.callOutRegular().copyWith(
                  color: context.appColors.textDisabled,
                ),
              ),
            ),
          ),
          if(widget.secureText) GestureDetector(
            onTap: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
            child: Icon(
              isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              color: context.appColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}


