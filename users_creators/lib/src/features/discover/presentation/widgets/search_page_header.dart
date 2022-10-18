import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:auto_route/auto_route.dart';

class DiscoverSearchPageHeader extends StatelessWidget {
  const DiscoverSearchPageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  context.router.navigateBack();
                },
                icon: SvgPicture.asset(
                  'assets/icons/top_panel/left_arrow.svg',
                  color: ColorsLimitless.textColor,
                  height: 12.r,
                ),
              )),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Search',
              maxLines: 1,
              style: TextStyle(
                  color: ColorsLimitless.textColor,
                  fontFamily: 'SF Pro',
                  letterSpacing: 0.5,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
