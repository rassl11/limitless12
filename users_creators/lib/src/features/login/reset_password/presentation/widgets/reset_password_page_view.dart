import 'package:components/buttons/app_buttons.dart';
import 'package:components/common_widgets/header/top_panel.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordPageView extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget content;
  final String button;
  final Function onTap;
  const ResetPasswordPageView(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.content,
      required this.button, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopPanel(),
              SizedBox(
                height: 100.h,
              ),
              Text(title.toUpperCase(),
                  style: const TextStyle(
                      color: ColorsLimitless.greyDark,
                      fontSize: 28,
                     letterSpacing: 1,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w800)),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: Text(subTitle,
                    style: const TextStyle(
                        color: ColorsLimitless.greyMedium,
                        fontSize: 16,
                         letterSpacing: 1,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w400)),
              ),
                      SizedBox(
                height: 20.h,
              ),
              content,
              const Expanded(child: SizedBox()),
              SizedBox(
                height: 16.h,
              ),
              AppButtons().redButton(context, button, (){
                onTap();
              }),
              
            ],
          ),
        ),
      ),
    );
  }
}
