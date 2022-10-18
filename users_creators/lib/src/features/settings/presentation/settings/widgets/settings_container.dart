import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsContainer extends StatelessWidget{
  final List<Widget> widgets;
  final String? title;
  const SettingsContainer({Key? key, required this.widgets, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.fromLTRB(10.r, 8, 10.r, 10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(title != null)Text(title!.toUpperCase(), style: TextStyle(
              color: ColorsLimitless.greyLight,
              fontFamily: 'SF Pro',
              fontSize: 11.sp,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w400),),
          if(title != null)SizedBox(
            height: 8.h,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6)
            ),
            child: Column(
              children: widgets,
            ),
          ),
        ],
      ),
    );
  }

}