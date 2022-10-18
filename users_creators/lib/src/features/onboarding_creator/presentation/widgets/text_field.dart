import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String? initial;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Widget suffix;

   const LoginTextField(
      {Key? key,
      this.onChanged,
      this.controller,
      required this.label,
      required this.validator,  this.suffix = const Offstage(), this.initial})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initial,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          fillColor: Colors.white,
          suffix: suffix,
          labelText: label,
          labelStyle: TextStyle(
              fontFamily: 'SF Pro',
              fontSize: 14.sp,
              color: Color(0xFFB1B5C3),
              fontWeight: FontWeight.w400),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(width: 1, color: Color(0xFF23262F)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(width: 1, color: Colors.grey[400]!),
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                width: 1,
              )),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(width: 1, color: Colors.red)),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(width: 1, color: Color(0xFFFF4747))),
        ),
        validator: validator);
  }
}
