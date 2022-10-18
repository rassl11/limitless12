import 'package:auto_route/auto_route.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopPanelHistory extends StatelessWidget {
  const TopPanelHistory({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 14.r),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                  alignment: FractionalOffset(-0.05,0),
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
                  'History',
                  maxLines: 1,
                  style: TextStyle(
                      color: ColorsLimitless.textColor,
                      fontFamily: 'SF Pro',
                      fontSize: 14.sp,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}