import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopPanelBottomSheet extends StatelessWidget {
  const TopPanelBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.11,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
                height: 22.h,
              ),
              SvgPicture.asset(
                'assets/icons/settings/divider.svg',
                color: ColorsLimitless.greyLight,
                height: 6.r,
              ),
          SizedBox(
            height: 22.h,
          ),
          Text(
            'Library',
            style: TextStyle(
                fontFamily: 'SF Pro',
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: 1),
          )
        ],
      ),
    );
    ;
  }
}
