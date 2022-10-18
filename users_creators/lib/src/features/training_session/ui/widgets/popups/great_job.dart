import 'package:components/buttons/app_buttons.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class GreatJob extends StatelessWidget {
  const GreatJob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
            borderRadius: BorderRadius.circular(6.r),
          ),
        child: Stack(
          children: [
            Container(decoration: BoxDecoration(
                gradient: LinearGradient(
          
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0),
                  Colors.white.withOpacity(0.1)
                ])),
              child: Image.asset('assets/images/training_session/background.png')),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 19.r),
              child: Column(
              
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        child: SvgPicture.asset(
                          'assets/icons/training_session/close.svg',
                          height: 25.r,
                        ),
                        onTap: (){
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                  Text(
                    'Great job!',
                    style: TextStyle(
                        fontFamily: "SF Pro",
                        fontSize: 30.sp,
                        letterSpacing: 0.5,
                        color: ColorsLimitless.textColor,
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    height: 25.r,
                  ),
                  SizedBox(
                      width: 0.5.sw,
                      child: Text(
                        'You\'ve finished \'Creator Name\'s\' Workout.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "SF Pro",
                            fontSize: 14.sp,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w500,
                            color: ColorsLimitless.greyMedium),
                      )),
                  SizedBox(
                    height: 20.r,
                  ),
                  SizedBox(
                      width: 0.5.sw,
                      child: Text(
                        'Subscribe to Support Them On Their Fitness Journey!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "SF Pro",
                            fontSize: 14.sp,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w500,
                            color: ColorsLimitless.greyMedium),
                      )),
                  SizedBox(
                    height: 35.r,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 22.r),
                    child: SizedBox(
                      height: 36.h,
                      child: Material(
                        borderRadius: BorderRadius.circular(6.r),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(6.r),
                          splashFactory: InkRipple.splashFactory,
                          splashColor: ColorsLimitless.brandColor,
                          child: Ink(
                            padding: EdgeInsets.zero,
                            height: 0.07.sh,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                color: ColorsLimitless.brandColor),
                            child: Center(
                              child: Text(
                                'Support \'Creator\' from \$1',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Sf",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.sp),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
