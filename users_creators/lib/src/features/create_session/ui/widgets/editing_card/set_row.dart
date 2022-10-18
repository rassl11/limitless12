import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetRow extends StatelessWidget {
  const SetRow({Key? key,required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: "SF Pro",
          fontSize: 11.sp,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w700,
          color: ColorsLimitless.textColor),
    );
  }
}
