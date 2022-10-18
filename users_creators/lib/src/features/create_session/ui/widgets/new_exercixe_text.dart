import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NewExerciseText extends StatelessWidget {
  const NewExerciseText(
      {Key? key,
      required this.showIcon,
      required this.validator,
      required this.controller, })
      : super(key: key);

  final Widget showIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.done,
      minLines: 1,
      maxLines: 10,
      autofocus: false,
      cursorColor: ColorsLimitless.textColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.r),
        filled: true,
        suffixIcon: showIcon,
        errorStyle: TextStyle(
            color: ColorsLimitless.brandColor,
            fontFamily: 'SF Pro',
            fontSize: 10.sp,
            letterSpacing: 0.5),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(
              width: 1, color: ColorsLimitless.greyLight.withOpacity(0.3)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(
              width: 1, color: ColorsLimitless.greyLight.withOpacity(0.3)),
        ),
        hintStyle: TextStyle(
            color: ColorsLimitless.greyLight,
            fontFamily: 'SF Pro',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400),
        hintMaxLines: 1,
        fillColor: Colors.white,
        labelStyle: TextStyle(
            fontFamily: 'SF Pro', fontSize: 14.sp, fontWeight: FontWeight.w400),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Color(0xFF23262F)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Color(0xFFE6E8EC)),
        ),
        border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
                width: 1, color: ColorsLimitless.greyLight.withOpacity(0.3))),
      ),
      validator: validator,
    );
  }
}
