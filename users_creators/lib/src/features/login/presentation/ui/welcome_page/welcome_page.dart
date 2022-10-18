import 'package:auto_route/auto_route.dart';
import 'package:components/buttons/app_buttons.dart';
import 'package:components/common_widgets/header/top_panel.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/login/presentation/ui/welcome_page/accept_agreement.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool accepted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 10.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopPanel(),
              SizedBox(
                height: 62.r,
              ),
              Text(
                'WELCOME',
                style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 26.sp,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 0.8.sw,
                child: Text(
                  "Set up your account now to start creating content and filling out your profile.",
                  style: TextStyle(
                      fontSize: 14.sp,
                      letterSpacing: 1,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w400,
                      height: 1.5),
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              SizedBox(
                width: 0.8.sw,
                child: Text(
                  "Once you’re ready, simply send us a request to turn your app live.",
                  style: TextStyle(
                      fontSize: 14.sp,
                      letterSpacing: 0.5,
                      fontFamily: 'SF Pro',
                      height: 1.5),
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              SizedBox(
                width: 0.8.sw,
                child: Text(
                  "We’re excited to have you onboard!",
                  style: TextStyle(
                      letterSpacing: 0.5,
                      fontSize: 14.sp,
                      fontFamily: 'SF Pro',
                      height: 1.5),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'The Limitless Team',
                style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 15.sp,
                    fontStyle: FontStyle.italic,
                    color: const Color(0xFF777E90)),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Agreement(accepted: accepted, onTap: (){
                setState(() {
                  accepted = !accepted;
                });
              },),
              SizedBox(
                height: 20.h,
              ),
            AppButtons().redButton(
              context, 
              'Next', 
              (){ context.router.navigateNamed('/creators-onboarding');}, 
              color: accepted ?  ColorsLimitless.brandColor : ColorsLimitless.greyLight )
            ],
          ),
        ),
      ),
    );
  }
}
