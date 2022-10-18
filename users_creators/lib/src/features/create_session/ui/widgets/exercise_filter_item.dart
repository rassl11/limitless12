import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExerciseFilterItem extends StatelessWidget {
  final bool isSelected;
  final String title;
  final Function onTap;
  const ExerciseFilterItem(
      {Key? key,
      required this.isSelected,
      required this.title,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (() => onTap()),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.r,vertical: 8.r),
          decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFF353945)
                  : const Color(0xFFE6E8EC),
              borderRadius: BorderRadius.circular(6.r)),
          child: Text(title,
          style: TextStyle(
            fontFamily: "SF Pro",
            fontSize: 13.sp,
            letterSpacing: 0.5,
            color: isSelected ? Colors.white : ColorsLimitless.greyMedium

          ),
          ),
        ));
  }
}
