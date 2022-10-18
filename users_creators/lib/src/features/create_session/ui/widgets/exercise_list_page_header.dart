import 'package:auto_route/auto_route.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ExerciseListPageHeader extends StatelessWidget{
  final String title;

  const ExerciseListPageHeader({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
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
                    'assets/icons/top_panel/left_arrow.svg',
                    color: ColorsLimitless.greyLight,
                    height: 16.r,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}