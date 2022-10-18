import 'package:auto_route/auto_route.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TermsPrivacyBottomSheet extends StatelessWidget{
  final String title;

  const TermsPrivacyBottomSheet({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.9,
      child: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          SizedBox(
            height: 40.h,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SF Pro',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      context.router.pop();
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/settings/close.svg',
                      color: ColorsLimitless.greyLight,
                      height: 18.r,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: ColorsLimitless.greyLight,)
        ],
      ),
    );
  }

}