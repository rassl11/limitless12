import 'package:auto_route/auto_route.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EditPasswordWidget extends StatelessWidget {
  const EditPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: false,
      onTap: (){
        context.router.navigateNamed('/edit-password-page');
      },
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/settings/settings.svg',
            height: 16.r,
          ),
          SizedBox(
            width: 12.w,
          ),
          Text(
            'Change password',
            style: TextStyle(
                color: ColorsLimitless.greyDark,
                fontFamily: 'SF Pro',
                fontSize: 16.sp,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w500),
          ),
          const Expanded(child: SizedBox()),
          SvgPicture.asset(
            'assets/icons/settings/arrow_right.svg',
            height: 16.r,
          )
        ],
      ),
    );
  }
}
