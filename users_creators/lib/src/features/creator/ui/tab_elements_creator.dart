import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabElementsCreator {
  static List<Tab> views = [
    Tab(
      height: 30.r,
      child: Center(
        child: Text(
          'Services',
          style: TextStyle(
              fontFamily: 'SF Pro',
              letterSpacing: 0.5,
              fontWeight: FontWeight.w500,
              fontSize: 13.sp),
        ),
      ),
    ),
    Tab(
      height: 30.r,
      child: Center(
        child: Text(
          'Workouts',
          style: TextStyle(
              fontFamily: 'SF Pro',
              letterSpacing: 0.5,
              fontWeight: FontWeight.w500,
              fontSize: 13.sp),
        ),
      ),
    ),
    Tab(
      height: 30.r,
      child: Center(
        child: Text(
          'Programs',
          style: TextStyle(
              fontFamily: 'SF Pro',
              letterSpacing: 0.5,
              fontWeight: FontWeight.w500,
              fontSize: 13.sp),
        ),
      ),
    ),
  ];
}
