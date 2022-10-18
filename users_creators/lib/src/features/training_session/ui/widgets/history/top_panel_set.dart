import 'package:auto_route/auto_route.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopPanelTrainingSetHistory extends StatelessWidget {
  const TopPanelTrainingSetHistory({ Key? key,required this.text }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 14.r),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                  alignment: const FractionalOffset(-0.05,0),
                  child: TextButton(
                    onPressed: () {
                      context.router.navigateBack();
                    },
                    child: Text('Back',
                    style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontSize: 12.sp,
                      color: ColorsLimitless.greyMedium,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w700
                    ),
                    )
                  )),
              Align(
                alignment: Alignment.center,
                child: Text(
                  text,
                  maxLines: 1,
                  style: TextStyle(
                      color: ColorsLimitless.textColor,
                      fontFamily: 'SF Pro',
                      fontSize: 14.sp,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}