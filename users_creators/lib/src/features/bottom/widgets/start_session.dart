import 'package:components/buttons/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class StartSession extends StatelessWidget {
  const StartSession({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 0.94.sw,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(6.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 12.r),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/corousel/color_man.png',
                    height: 45.r,
                  ),
                  SizedBox(
                    width: 12.r,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Magnus Lygdback',
                        style: TextStyle(
                            fontFamily: 'SF Pro',
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp,
                            letterSpacing: 1.1),
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Text(
                        'My Fitness Journey',
                        style: TextStyle(
                            fontFamily: "SF Pro",
                            fontSize: 12.sp,
                            color: const Color(0xFF777E90)),
                      )
                    ],
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  GestureDetector(
                    child: SvgPicture.asset(
                      'assets/icons/start_session/settings.svg',
                      height: 22.r,
                    ),
                  )
                ],
              ),
              const Expanded(
                child: SizedBox(),
              ),
              AppButtons().redButton(context, 'Start Session', (){})
            ],
          ),
        ));
  }
}