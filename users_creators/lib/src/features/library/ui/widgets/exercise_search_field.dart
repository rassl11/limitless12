import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExerciseSearchField extends StatelessWidget {
  final FocusNode? focusNode;
  final Function(String) onChanged;
  final TextEditingController controller;

  const ExerciseSearchField(
      {Key? key, this.focusNode, required this.onChanged, required this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      cursorWidth: 1.r,
      controller: controller,
      onChanged: (v) {
        onChanged(v);
      },
      cursorColor: ColorsLimitless.textColor,
      textAlignVertical: TextAlignVertical.bottom,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 5.r, top: 9.r, bottom: 9.r),
          child: SvgPicture.asset(
            'assets/icons/discover/search.svg',
            color: ColorsLimitless.greyLight,
          ),
        ),
        filled: true,
        fillColor: ColorsLimitless.greyLight.withOpacity(0.15),
        hintText: 'Search exercises',
        hintStyle: TextStyle(
            fontFamily: 'SF Pro',
            fontSize: 13.sp,
            letterSpacing: 0.5,
            color: ColorsLimitless.greyLight,
            fontWeight: FontWeight.w400),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(width: 1, color: Colors.transparent),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(width: 1, color: Colors.transparent),
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(
              width: 1,
            )),
      ),
    );
  }
}
