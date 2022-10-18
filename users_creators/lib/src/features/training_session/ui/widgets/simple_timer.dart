import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SimpleTimer extends StatelessWidget {
   SimpleTimer({Key? key, required this.value,
      required this.minutes,
      required this.pause,
      required this.seconds,
      required this.timerDuration,
      required this.totalDurationInSeconds,
      required this.changePauseStatus,
      required this.addDuration,
      required this.reset,
      required this.substractDuration}) : super(key: key);
  
  

  final double value;
  final String minutes;
  final String seconds;
  final bool pause;
  final Function changePauseStatus;
  final Function addDuration;
  final Function substractDuration;
  final Function reset;
  Duration timerDuration;
  int totalDurationInSeconds;

  @override
  Widget build(BuildContext context) {
    return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.r),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 16.h,
                            ),
                            SvgPicture.asset(
                              'assets/icons/settings/divider.svg',
                              color: ColorsLimitless.greyLight.withOpacity(0.4),
                              height: 6.r,
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Text('${minutes}:${seconds}',
                                style: TextStyle(
                                    color: ColorsLimitless.brandColor,
                                    fontFamily: 'SF Pro',
                                    fontSize: 42.sp,
                                    fontWeight: FontWeight.w300)),
                            Text(
                              'Rest',
                              style: TextStyle(
                                  color: ColorsLimitless.brandColor,
                                  fontFamily: 'SF Pro',
                                  fontSize: 12.sp,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            LinearProgressIndicator(
                              value: value,
                              backgroundColor:
                                  ColorsLimitless.brandColor.withOpacity(0.04),
                              color: ColorsLimitless.brandColor,
                              minHeight: 5,
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  child: Container(
                                    padding: EdgeInsets.all(10.r),
                                    decoration: BoxDecoration(
                                        color: ColorsLimitless.brandColor
                                            .withOpacity(0.04),
                                        shape: BoxShape.circle),
                                    child: SvgPicture.asset(
                                        'assets/icons/training_session/refresh.svg'),
                                  ),
                                  onTap: () {
                                reset();
                                  },
                                ),
                                SizedBox(
                                  width: 8.r,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                  addDuration();
                                    },
                                    child: Container(
                                      height: 45.h,
                                      decoration: BoxDecoration(
                                          color: ColorsLimitless.brandColor
                                              .withOpacity(0.04),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30.r),
                                              bottomLeft:
                                                  Radius.circular(30.r))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/training_session/plus_timer.svg',
                                          ),
                                          SizedBox(
                                            width: 8.w,
                                          ),
                                          Text(
                                            '15 sec',
                                            style: TextStyle(
                                                color:
                                                    ColorsLimitless.brandColor,
                                                fontFamily: 'SF Pro',
                                                fontSize: 13.sp,
                                                letterSpacing: 0.7,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 6.r,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                      substractDuration();
                                      },
                                      child: Container(
                                        height: 45.h,
                                        decoration: BoxDecoration(
                                            color: ColorsLimitless.brandColor
                                                .withOpacity(0.04),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(30.r),
                                                bottomRight:
                                                    Radius.circular(30.r))),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '15 sec',
                                              style: TextStyle(
                                                  color: ColorsLimitless
                                                      .brandColor,
                                                  fontFamily: 'SF Pro',
                                                  fontSize: 13.sp,
                                                  letterSpacing: 0.7,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(
                                              width: 8.r,
                                            ),
                                            SvgPicture.asset(
                                              'assets/icons/training_session/minus_timer.svg',
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  width: 8.r,
                                ),
                                GestureDetector(
                                  child: pause == false
                                      ? Container(
                                          padding: EdgeInsets.all(10.r),
                                          decoration: const BoxDecoration(
                                              color: ColorsLimitless.brandColor,
                                              shape: BoxShape.circle),
                                          child: SvgPicture.asset(
                                              'assets/icons/training_session/play_timer.svg'))
                                      : Container(
                                          padding: EdgeInsets.all(10.r),
                                          decoration: BoxDecoration(
                                              color: ColorsLimitless.brandColor
                                                  .withOpacity(0.04),
                                              shape: BoxShape.circle),
                                          child: SvgPicture.asset(
                                            'assets/icons/training_session/new_pause.svg',
                                            color: Colors.red,
                                          )),
                                  onTap: () {
                                  changePauseStatus();
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      );
  }
}