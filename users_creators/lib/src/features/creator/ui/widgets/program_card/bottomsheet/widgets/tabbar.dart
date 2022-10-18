import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgramTabBar extends StatefulWidget {
  final TabController controller;

  const ProgramTabBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<ProgramTabBar> createState() => _ProgramTabBarState();
}

class _ProgramTabBarState extends State<ProgramTabBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 38.r,
        decoration: BoxDecoration(
          color: ColorsLimitless.grayNeutrals,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.r, vertical: 3.r),
          child: TabBar(
            controller: widget.controller,
            isScrollable: false,
            labelColor: ColorsLimitless.textColor,
            labelPadding: EdgeInsets.only(
              top: 2.h,
              left: 10.w,
              right: 10.w,
            ),
            unselectedLabelColor: ColorsLimitless.greyLight,
            indicator: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.r),
            ),
            tabs: [
              Text(
                'Overview',
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Workouts',
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
