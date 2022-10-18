import 'package:auto_route/auto_route.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class DiscoverPageHeader extends StatelessWidget {
  bool showBackButton;
  DiscoverPageHeader({Key? key, required this.showBackButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 14.r),
          child: GestureDetector(
            child: SvgPicture.asset(
              'assets/icons/top_panel_library/left_arrow.svg',
              height: 15.r,
            ),
            onTap: () {
              context.navigateBack();
            },
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            'Discover',
            maxLines: 1,
            style: TextStyle(
                color: ColorsLimitless.textColor,
                fontFamily: 'SF Pro',
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 5.r),
          child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  context.router.navigateNamed('/discover-search-page');
                },
                icon: SvgPicture.asset('assets/icons/discover/search.svg',
                    color: ColorsLimitless.textColor, height: 20.r),
              )),
        )
      ],
    );
  }
}
