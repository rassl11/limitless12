import 'package:auto_route/auto_route.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.r, vertical: 10.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: SvgPicture.asset(
                      'assets/icons/top_panel_library/left_arrow.svg',
                      height: 15.r,
                    ),
                    onTap: () {
                      context.navigateBack();
                    },
                  ),
                  Text(
                    'My Tiktok Workouts (18)',
                    style: TextStyle(
                      color: ColorsLimitless.greyDark,
                      fontFamily: 'SF Pro',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
