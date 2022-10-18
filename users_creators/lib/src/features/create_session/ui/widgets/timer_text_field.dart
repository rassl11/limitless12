import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TimerField extends StatelessWidget {
  const TimerField(
      {Key? key, required this.validator, required this.controller})
      : super(key: key);

  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40.r,
        width: 60.r,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r)),
        child: TextFormField(
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          controller: controller,
          minLines: 1,
          maxLines: 10,
          autofocus: false,
          cursorColor: ColorsLimitless.textColor,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10.r),
            filled: true,
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
                fontFamily: 'SF Pro',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
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
                    width: 1,
                    color: ColorsLimitless.greyLight.withOpacity(0.3))),
          ),
          inputFormatters: [
        LengthLimitingTextInputFormatter(10),
      ],
          validator: validator,
        ));
  }
}
