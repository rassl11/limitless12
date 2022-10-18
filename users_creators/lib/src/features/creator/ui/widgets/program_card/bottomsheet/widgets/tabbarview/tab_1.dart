import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/days_workouts.dart';
import 'widgets/program_faq.dart';
import 'widgets/program_tags_bunch.dart';
import 'widgets/upper_info.dart';

class ProgramTab1 extends StatelessWidget {
  const ProgramTab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 36.h,
        bottom: 69.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pro Full Body',
            style: TextStyle(
              fontFamily: 'SF Pro',
              fontSize: 22.sp,
              color: const Color(0xFF23262F),
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 20.h),
          const DaysWorkouts(),
          SizedBox(height: 24.h),
          const ProgramUpperInfoBlock(),
          SizedBox(height: 24.h),
          const ProgramTagsBunch(),
          SizedBox(height: 24.h),
          Text(
            'About',
            style: TextStyle(
              fontFamily: 'SF Pro',
              fontSize: 32.sp,
              color: const Color(0xFF23262F),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 9.h),
          Text(
            '''
Ready to make booty gains? The Glute Growth program is designed to build muscle and strength to your glutes and lower body. We are going to hit the lower body 3 times per week with a glute focus and the upper body 2 times per week to sculpt those arms and abs! recommend to always have a rest day in between your lower body routines which gives you a chance to focus on upper body or recovery (yoga, pilates, stretching).
 At the beginning of each lower body session set up a glute activation circuit to get you all warmed up and a cool down at the end to help with recovery and flexibility.   This is a 4 week program! Each week will look the ''',
            style: TextStyle(
              fontFamily: 'SF Pro',
              fontSize: 14.sp,
              color: const Color(0xFF777E91),
              fontWeight: FontWeight.w400,
              height: 1.3,
            ),
          ),
          SizedBox(height: 16.h),
          const Divider(color: Color(0xffF3F3F5), height: 0.0),
          SizedBox(height: 16.h),
          const ProgramFaq(),
        ],
      ),
    );
  }
}
