import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalRecord extends StatelessWidget {
  const PersonalRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Personal record',
          style: TextStyle(
            fontFamily: "SF Pro",
            fontSize: 14.sp,
            color: ColorsLimitless.textColor,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(
          height: 8.r,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14.r, vertical: 14.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r), color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '12 Rep Max',
                style: TextStyle(
                  fontFamily: "SF Pro",
                  fontSize: 12.sp,
                  color: ColorsLimitless.greyMedium,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(
                height: 8.r,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '3 x 12 @ 20 kg',
                      style: TextStyle(
                        fontFamily: "SF Pro",
                        fontSize: 12.sp,
                        color: ColorsLimitless.greyMedium,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  Text(
                    'Feb 28, 2022',
                    style: TextStyle(
                      fontFamily: "SF Pro",
                      fontSize: 11.sp,
                      color: ColorsLimitless.brandColor,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
