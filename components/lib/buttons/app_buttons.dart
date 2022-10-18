import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors.dart';

class AppButtons {
  Widget onboardingButton(String text, Function onPressed,
      [Color color = Colors.white]) {
    return TextButton(
      focusNode: FocusNode(),
      clipBehavior: Clip.none,
      onPressed: () => onPressed(),
      style: TextButton.styleFrom(primary: Colors.transparent),
      child: Text(
        text,
        style: TextStyle(
            color: color,
            fontFamily: "SF Pro Display",
            fontWeight: FontWeight.w400,
            fontSize: 14.r),
      ), //ripple color
    );
  }

  Widget redButton(
    BuildContext context,
    String text,
    void Function()? onPressed, {
    bool isLarge = true,
    double width = 120,
    FontWeight fontWeight = FontWeight.w700,
    double fontSize = 16,
    Color color = ColorsLimitless.brandColor,
    Color textColor = Colors.white,
    int radius = 6,
  }) {
    if (onPressed == null) color = color.withOpacity(.6);

    return SizedBox(
      height: 40.h,
      width: isLarge ? MediaQuery.of(context).size.width : width,
      child: Material(
        borderRadius: BorderRadius.circular(radius.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(radius.r),
          splashFactory: InkRipple.splashFactory,
          splashColor: color,
          onTap: onPressed,
          child: Ink(
            padding: EdgeInsets.zero,
            height: 0.07.sh,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: color,
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontFamily: "Sf",
                  letterSpacing: 0.7,
                  fontWeight: fontWeight,
                  fontSize: fontSize.sp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget addButton(Function onPressed) {
    return SizedBox(
      height: 50,
      child: InkWell(
        // splashColor: ColorsLimitless.brandColor,
        child: Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              color: ColorsLimitless.greyMedium,
              blurRadius: 10.0,
              spreadRadius: 0.0,
              offset: Offset(-4.0, 4.0), // shadow direction: bottom right
            )
          ], shape: BoxShape.circle, color: ColorsLimitless.brandColor),
          child: const Center(
              child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Center(
                child: Icon(
              Icons.add,
              color: Colors.white,
            )),
          )),
        ),
        onTap: () => onPressed(),
      ),
    );
  }
}
