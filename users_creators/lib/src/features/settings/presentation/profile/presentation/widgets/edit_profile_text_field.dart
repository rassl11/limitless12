import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class EditProfileTextField extends StatelessWidget {
  final String hintText;
  final String title;
  final bool isSmallSize;
  final Widget? suffix;
  bool? obscureText;
  String? Function(String?)? validate;
  final Function(String) onChanged;
  final TextEditingController textEditingController;
  EditProfileTextField({
    Key? key,
    required this.hintText,
    this.obscureText,
    required this.title,
    this.suffix,
    this.validate,
    this.isSmallSize = false,
    required this.textEditingController,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: ColorsLimitless.greyDark,
              fontFamily: 'SF Pro',
              fontSize: 14.sp,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 6.r,
        ),
        SizedBox(
          height: 60.h,
          width: isSmallSize
              ? MediaQuery.of(context).size.width * 0.4
              : MediaQuery.of(context).size.width,
          child: TextFormField(
            onChanged: (value) {
              onChanged(value);
            },
            controller: textEditingController,
            obscureText: obscureText ?? false,
            validator: validate,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10.0),
              filled: true,
              suffix: suffix ?? const Offstage(),
              hintText: hintText,
              hintStyle: TextStyle(
                  color: ColorsLimitless.greyLight,
                  fontFamily: 'SF Pro',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
              hintMaxLines: 1,
              fillColor: Colors.transparent,
              labelStyle: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                    width: 1,
                    color: ColorsLimitless.greyLight.withOpacity(0.5)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                    width: 1,
                    color: ColorsLimitless.greyLight.withOpacity(0.5)),
              ),
              border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(
                      width: 1,
                      color: ColorsLimitless.greyLight.withOpacity(0.3))),
              errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: Colors.red)),
              focusedErrorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide:
                      BorderSide(width: 1, color: ColorsLimitless.greyLight)),
            ),
          ),
        ),
      ],
    );
  }
}
