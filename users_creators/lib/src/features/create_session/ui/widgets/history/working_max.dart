import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkingMax extends StatelessWidget {
  const WorkingMax({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Working Max',
          style: TextStyle(
            fontFamily: "SF Pro",
            fontSize: 14.sp,
            color: ColorsLimitless.textColor,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(height: 14.r,),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12.r),
          decoration: BoxDecoration(
            border: Border.all(color: ColorsLimitless.brandColor),
            borderRadius: BorderRadius.circular(6.r)
          ),
          child: Center(child: Text('0 kg',
          style: TextStyle(
            fontFamily: "SF Pro",
            fontSize: 13.sp,
            color: ColorsLimitless.brandColor,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
          )),
        )
      ],
    );
  }
}
