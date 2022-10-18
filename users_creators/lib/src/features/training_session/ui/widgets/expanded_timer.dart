import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExpandedTimer extends StatefulWidget {
  ExpandedTimer(
      {Key? key,
      required this.value,
      required this.minutes,
      required this.pause,
      required this.seconds,
      required this.timerDuration,
      required this.totalDurationInSeconds,
      required this.changePauseStatus,
      required this.addDuration,
      required this.reset,
      required this.substractDuration})
      : super(key: key);

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
  _ExpandedTimerState createState() => _ExpandedTimerState();
}

class _ExpandedTimerState extends State<ExpandedTimer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 20.r,
        ),
        SvgPicture.asset(
          'assets/icons/settings/divider.svg',
          color: ColorsLimitless.greyLight.withOpacity(0.4),
          height: 6.r,
        ),
        SizedBox(
          height: 60.r,
        ),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          height: 350.r,
          width: 350.r,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/training_session/asd.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(22.r),
                child: CircularProgressIndicator(
                  backgroundColor: ColorsLimitless.brandColor.withOpacity(0.04),
                  valueColor: const AlwaysStoppedAnimation<Color>(
                      ColorsLimitless.brandColor),
                  value: widget.value,
                ),
              ),
              Center(
                child: Container(
                  height: 290.r,
                  width: 290.r,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    // color: Colors.white
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Center(
                        child: Text('${widget.minutes}:${widget.seconds}',
                            style: TextStyle(
                                color: ColorsLimitless.brandColor,
                                fontFamily: 'SF Pro',
                                fontSize: 58.sp,
                                fontWeight: FontWeight.w300)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 30.r),
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Rest',
                              style: TextStyle(
                                  color: ColorsLimitless.brandColor,
                                  fontFamily: 'SF Pro',
                                  fontSize: 14.sp,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.r,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 8.r,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    widget.addDuration();
                  },
                  child: Container(
                    height: 60.r,
                    decoration: BoxDecoration(
                        color: ColorsLimitless.brandColor.withOpacity(0.04),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.r),
                            bottomLeft: Radius.circular(30.r))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                              color: ColorsLimitless.brandColor,
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
                width: 4.r,
              ),
              GestureDetector(
                child: widget.pause == false
                    ? Container(
                        height: 60.r,
                        width: 60.r,
                        padding: EdgeInsets.all(18.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: ColorsLimitless.brandColor,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/training_session/play_timer.svg',
                        ))
                    : Container(
                        height: 60.r,
                        width: 60.r,
                        padding: EdgeInsets.all(18.r),
                        decoration: BoxDecoration(
                          color: ColorsLimitless.brandColor.withOpacity(0.04),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/training_session/new_pause.svg',
                          color: Colors.red,
                        )),
                onTap: () {
                  widget.changePauseStatus();
                },
              ),
              SizedBox(
                width: 4.r,
              ),
              Expanded(
                child: GestureDetector(
                    onTap: () {
                      widget.substractDuration();
                    },
                    child: Container(
                      height: 60.r,
                      decoration: BoxDecoration(
                          color: ColorsLimitless.brandColor.withOpacity(0.04),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30.r),
                              bottomRight: Radius.circular(30.r))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '15 sec',
                            style: TextStyle(
                                color: ColorsLimitless.brandColor,
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
            ],
          ),
        ),
        SizedBox(
          height: 50.r,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.r),
          child: SizedBox(
            height: 60.r,
            width: 1.sw,
            child: Material(
              borderRadius: BorderRadius.circular(6.r),
              child: InkWell(
                borderRadius: BorderRadius.circular(6.r),
                splashFactory: InkRipple.splashFactory,
                splashColor: ColorsLimitless.brandColor,
                onTap: () {
                  widget.reset();
                },
                child: Ink(
                  padding: EdgeInsets.zero,
                  height: 0.07.sh,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: ColorsLimitless.brandColor,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                            'assets/icons/training_session/reset_text.svg'),
                        SizedBox(
                          width: 5.r,
                        ),
                        Text(
                          'Reset',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Sf",
                            letterSpacing: 0.7,
                            fontWeight: FontWeight.w700,
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
