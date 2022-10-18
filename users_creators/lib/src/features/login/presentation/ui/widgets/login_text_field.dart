import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final Color color;
  final Widget? suffix;
  final TextInputType textInputType;
  final bool? obscureText;

  const LoginTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.validator,
    required this.suffix,
    required this.color,
    this.textInputType = TextInputType.text,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscureText ?? false,
        autocorrect: false,
        cursorColor: ColorsLimitless.greyDark,
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          floatingLabelStyle: const TextStyle(color: ColorsLimitless.greyDark),
          suffixIcon: suffix,
          suffixIconConstraints: const BoxConstraints(
              maxHeight: 30, minHeight: 20, maxWidth: 60, minWidth: 50),
          filled: true,
          enabled: true,
          fillColor: color,
          hintText: label,
          hintStyle: TextStyle(
            fontFamily: 'SF Pro',
            letterSpacing: 0.5,
            fontSize: 14.sp,
            color: ColorsLimitless.greyMedium,
            fontWeight: FontWeight.w400,
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.transparent),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.transparent),
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
              )),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Colors.red)),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Colors.transparent)),
        ),
        validator: validator);
  }
}
