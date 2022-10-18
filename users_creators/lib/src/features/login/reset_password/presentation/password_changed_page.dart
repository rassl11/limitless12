import 'package:auto_route/auto_route.dart';
import 'package:components/buttons/app_buttons.dart';
import 'package:components/common_widgets/header/top_panel.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PasswordChangedPage extends StatelessWidget {
  const PasswordChangedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TopPanel(),
              const Expanded(child: SizedBox()),
              SvgPicture.asset(
                'assets/icons/login/success.svg',
                height: 124.r,
              ),
              SizedBox(
                height: 40.h,
              ),
              Text('Password Changed',
                  style: TextStyle(
                    letterSpacing: 0.7,
                    color: ColorsLimitless.green,
                    fontSize: 24.sp,
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w700,
                  )),
              SizedBox(
                height: 8.h,
              ),
              Text(
                  'Password changed successfully, you can login again with a new password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 0.7,
                    color: ColorsLimitless.greyMedium,
                    fontSize: 16.sp,
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w400,
                  )),
              const Expanded(child: SizedBox()),
              AppButtons().redButton(context, 'Login', () {
                context.router.navigateNamed('/user-login');
              }),
              SizedBox(
                height: 16.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
