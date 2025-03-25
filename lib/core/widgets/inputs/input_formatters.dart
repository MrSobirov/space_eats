import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


class InputMasks {
  static MaskTextInputFormatter phoneMask2Formatter = MaskTextInputFormatter(
    mask: '+998 ## ### ## ##',
    filter: { "#": RegExp(r'[0-9]')},
  );
}