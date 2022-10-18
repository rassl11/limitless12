import 'dart:ui';

import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'questionnaire/widgets/close_icon.dart';

showLimitedOneDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 304.w,
                      height: 320.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 12.sp),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Positioned(
                            top: 0,
                            child: SvgPicture.asset(
                              'assets/images/creator/service_questionnaire_answers_complete.svg',
                              height: 168.h,
                              width: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 36.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Limitless One",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorsLimitless.greyDark,
                                    fontSize: 33.sp,
                                    fontFamily: 'SF Pro',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                Text(
                                  "Sorry, you can't access this page: Only Limitless One subscribers can access this content",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: const Color(0xFF777E91),
                                    fontSize: 16.sp,
                                    fontFamily: 'SF Pro',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 30.h),
                                Material(
                                  borderRadius: BorderRadius.circular(6.r),
                                  child: InkWell(
                                    onTap: () {},
                                    borderRadius: BorderRadius.circular(6.r),
                                    splashFactory: InkRipple.splashFactory,
                                    splashColor: const Color(0xFFBA4454),
                                    child: Ink(
                                      padding: EdgeInsets.zero,
                                      height: 0.060.sh,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6.r),
                                        color: const Color(0xFFE94359),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Got it',
                                          style: TextStyle(
                                            color: const Color(0xFFFCFCFD),
                                            fontFamily: "SF Pro",
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 24.h),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const CloseIcon(),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
