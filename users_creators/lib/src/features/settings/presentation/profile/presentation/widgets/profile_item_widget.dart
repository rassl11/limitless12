import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileItemWidget extends StatelessWidget {
  final String icon;
  final String title;
  final Function() onTap;
  final bool showArrow;

  const ProfileItemWidget(
      {Key? key, required this.icon, required this.title, required this.onTap, this.showArrow = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.r,vertical: 14.r),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(6.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 8.r,
                ),
                SvgPicture.asset(
                  icon,
                  height: 16.r,
                ),
                SizedBox(
                  width: 8.r,
                ),
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'SF Pro',
                      letterSpacing: 0.8,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            showArrow ? Padding(
              padding:  EdgeInsets.only(right: 15.r),
              child: SvgPicture.asset(
                'assets/icons/settings/arrow_right.svg',
                height: 14.r,
              ),
            ) : const Offstage(),

          ],
        ),
      ),
    );
  }
}
