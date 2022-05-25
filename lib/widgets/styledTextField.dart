import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

Widget styledTextField({
  required TextEditingController controller,
  required String label,
  required String hintText,
  double? radius,
  double? padding,
  Color? color,
  Color? colorHint,
  Color? colorLabel,
  Color? colorBorderFocus,
  Color? colorBorderUnFocus,
  Color? focusColor,
  Color? cursorColor,
  Color? styleTextInput,
  bool obscureText = false,
  VoidCallback? onPressed,
  FormFieldValidator<String>? onValidate,
  GlobalKey<FormState>? formKey,
  int maxLines = 1,
// String? Function(String?)? onValidate,
  String? Function(String?)? onChanged,
  String? Function(String?)? onSubmit,
  TextInputAction? action,
  TextInputType? inputType = TextInputType.text,
  bool isPassword = false,
  Icon? leadingIcon,
  Key? key,
}) {
  return Container(
    padding: EdgeInsets.only(
      bottom: padding == null ? 0 : padding,
    ),
    child: Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: TextField(
        key: key,
        obscureText: obscureText,
        onChanged: onChanged,
        onSubmitted: onSubmit,
        cursorColor: cursorColor != null ? cursorColor : Colors.black,
        keyboardType: inputType,
        style: TextStyle(
            color: styleTextInput != null ? styleTextInput : Colors.black),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(19.0),
          labelText: label,
          hintText: hintText,
          labelStyle: TextStyle(
            color: colorLabel != null ? colorLabel : Colors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
          hintStyle: TextStyle(
            color: colorHint != null ? colorHint : Colors.grey,
            fontSize: 14.0,
          ),
          prefixIcon: leadingIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: colorBorderUnFocus != null
                  ? colorBorderUnFocus
                  : Colors.black.withOpacity(0.13),
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(

                color: colorBorderFocus != null
                    ? colorBorderFocus
                    : const Color(0xff112C47),
                width: 1.1),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    ),
  );
}
