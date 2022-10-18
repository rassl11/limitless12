import 'package:auto_route/auto_route.dart';
import 'package:components/buttons/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/config/router.dart';

class WelcomeUserPage extends StatelessWidget {
  final String username;

  const WelcomeUserPage({
    super.key,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned.fill(
                      child: SvgPicture.asset(
                        'assets/images/creator/service_questionnaire_answers_complete.svg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 64.h),
                      child: SvgPicture.asset(
                        'assets/icons/top_panel/logo.svg',
                        fit: BoxFit.fitHeight,
                        height: 24.h,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to Limitless, $username!'.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 0.01,
                        fontFamily: "SF Pro",
                        fontSize: 24.sp,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF23262F),
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'We\'re glad to have you here. Ready to start browsing fitness content? Check out all we have to offer!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "SF Pro",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF353945),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 16.w,
                        left: 16.w,
                        right: 16.w,
                      ),
                      child: AppButtons().redButton(context, 'Start Now', () {
                        context.router.push(
                          BottomBarPageRoute(initialIndex: 2),
                        );
                      }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 16.w,
                        left: 16.w,
                        right: 16.w,
                      ),
                      child: AppButtons().redButton(
                        context,
                        'Skip',
                        () {
                          context.router.push(
                            BottomBarPageRoute(initialIndex: 0),
                          );
                        },
                        color: Colors.transparent,
                        textColor: const Color(0xff777E91),
                      ),
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
