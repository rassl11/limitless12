import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TopPanel extends StatelessWidget {
  Function? onTap;
   TopPanel({ Key? key , this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        InkWell(
          onTap: () {
            onTap != null ? 
            onTap!() : context.router.navigateBack();
          },
          child: SvgPicture.asset('assets/icons/top_panel/left_arrow.svg',height: 14.r,)),
      const  Expanded(child: SizedBox()),
        SvgPicture.asset('assets/icons/top_panel/logo.svg',height: 22.r),
      SizedBox(width: 16.r,),
      const  Expanded(child: SizedBox(),)


      ],
    );
  }
}