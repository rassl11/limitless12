import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:auto_route/auto_route.dart';

class DiscoverResultHeader extends StatelessWidget {
  final String tag;
  final bool showHashTag;
  const DiscoverResultHeader({Key? key, required this.tag,required this.showHashTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
              alignment: FractionalOffset(-0.05,0),
              child: IconButton(
                onPressed: () {
                  context.router.navigateBack();
                },
                icon: SvgPicture.asset(
                  'assets/icons/top_panel/left_arrow.svg',
                  color: ColorsLimitless.textColor,
                  height: 12.r,
                ),
              )),
          Align(
            alignment: Alignment.center,
            child: 
            
            Text(
              showHashTag == true ?
              '#$tag' : tag,
              maxLines: 1,
              style: TextStyle(
                  color: ColorsLimitless.textColor,
                  fontFamily: 'SF Pro',
                  fontSize: 14.sp,
                  letterSpacing: 0.7,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
