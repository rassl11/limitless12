// LoginRepo().getAuthData()?.userName;
import 'package:auto_route/auto_route.dart';
import 'package:components/buttons/app_buttons.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users_creators/src/core/config/router.dart';
import 'package:users_creators/src/features/login/repo/login_repo.dart';

class WelcomeCreatorPage extends StatelessWidget {
  const WelcomeCreatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final username = LoginRepo().getAuthData()?.userName;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .25,
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
                    padding: EdgeInsets.only(top: 10.h),
                    child: SvgPicture.asset(
                      'assets/icons/top_panel/logo.svg',
                      fit: BoxFit.fitHeight,
                      height: 24.h,
                    ),
                  ),
                ],
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
                      'Welcome, $username!'.toUpperCase(),
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
                      'We\'re happy to have you here. It\'s time to start creating your amazing workouts and building your fitness followers!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "SF Pro",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF353945),
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * .07),
                    Text(
                      'Now you\'re signed up, you can create workouts, training programs and more!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "SF Pro",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF777E91),
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      'Check out',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "SF Pro",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF777E91),
                        height: 1.4,
                      ),
                    ),
                    AppButtons().onboardingButton(
                      'How to create your first workout',
                      () {},
                      ColorsLimitless.brandColor,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
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
                  SizedBox(height: 16.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
