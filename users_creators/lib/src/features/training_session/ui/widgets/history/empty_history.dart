import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EmptyHistory extends StatelessWidget {
  const EmptyHistory({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/icons/training_session/time.svg'),
        SizedBox(height: 12.r,),
        Text('No Logged Entries Found',
        style: TextStyle(
          fontFamily: 'SF Pro',
          fontSize: 16.sp,
          letterSpacing: 0.5,
          color: ColorsLimitless.greyMedium,
          fontWeight: FontWeight.w500
        ),
        ),
        SizedBox(height: 12.r,),
        SizedBox(
          width: 0.6.sw,
          child: Text('You haven\'t completed this workout yet! Once you complete it, your session will be saved here.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'SF Pro',
            height: 1.65,
            fontSize: 13.sp,
            letterSpacing: 0.5,
            color: ColorsLimitless.greyMedium,
            fontWeight: FontWeight.w400
          ),),
        )
      ],
      
    );
  }
}