import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BottomBarItem extends StatelessWidget {
  final String icon;
  final String title;
  final Function onTap;
  final bool isActive;

  const BottomBarItem(
      {Key? key,
      required this.icon,
      this.title = '',
      required this.onTap,
      required this.isActive})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        focusNode: FocusNode(),
        onTap: () => onTap(),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(icon,
                  color: isActive
                      ? ColorsLimitless.greyDark
                      : ColorsLimitless.greyLight),
              SizedBox(
                height: 7.h,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 13.sp,
                    fontFamily: 'SF Pro',
                    color: isActive
                        ? ColorsLimitless.greyDark
                        : ColorsLimitless.greyLight),
              ),
            ],
          ),
        ));
  }
}
