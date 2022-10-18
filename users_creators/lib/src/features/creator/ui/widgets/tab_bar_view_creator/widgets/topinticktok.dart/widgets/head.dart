import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Head extends StatelessWidget {
  const Head({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Top in Tiktok Workouts',
          style: TextStyle(
            fontSize: 16.sp,
            color: const Color(0xFF23262F),
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w700,
          ),
        ),
        TextButton(
          onPressed: () {
            context.router.pushNamed('/workouts-view-all-page');
          },
          child: Text(
            'View all',
            style: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xFFE94359),
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
