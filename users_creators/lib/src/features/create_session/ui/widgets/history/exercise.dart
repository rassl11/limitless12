import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Exercise extends StatelessWidget {
  const Exercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Monday Feb 28, 2022',
                style: TextStyle(
                    fontFamily: "SF Pro",
                    fontSize: 14.sp,
                    color: ColorsLimitless.textColor,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5),
              ),
            ),
            GestureDetector(
              child: Text(
                'Edit',
                style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 12.sp,
                    color: ColorsLimitless.brandColor,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.r,
        ),
        Text(
          '2 x 12 @ 10, 20 kg',
          style: TextStyle(
              fontFamily: 'SF Pro',
              fontSize: 12.sp,
              color: ColorsLimitless.greyMedium,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5),
        ),
        SizedBox(
          height: 10.r,
        ),
        Row(
          children: [
            SvgPicture.asset('assets/icons/create_session/kubok.svg'),
            SizedBox(
              width: 10.r,
            ),
            Text(
              '12 Rep max',
              style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 12.sp,
                  color: ColorsLimitless.greyMedium,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5),
            )
          ],
        )
      ],
    );
  }
}
