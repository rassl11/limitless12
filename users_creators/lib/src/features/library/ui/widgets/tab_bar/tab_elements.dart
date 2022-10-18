import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final _tabsTextStyle = TextStyle(
  fontFamily: 'SF Pro',
  letterSpacing: 0.5,
  fontWeight: FontWeight.w500,
  fontSize: 12.sp,
);

class TabElements {
  static List<Tab> views = [
    Tab(
      height: 30.r,
      child: Center(
        child: Text('Sessions', style: _tabsTextStyle),
      ),
    ),
    Tab(
      height: 30.r,
      child: Center(
        child: Text('Programs', style: _tabsTextStyle),
      ),
    ),
    Tab(
      height: 30.r,
      child: Center(
        child: Text('Teams', style: _tabsTextStyle),
      ),
    ),
    Tab(
      height: 30.r,
      child: Center(
        child: Text('Exercises', style: _tabsTextStyle),
      ),
    )
  ];
}
