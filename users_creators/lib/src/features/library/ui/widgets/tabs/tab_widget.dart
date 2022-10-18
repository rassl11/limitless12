import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabWidget extends StatelessWidget {
  final String title;

  const TabWidget({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 40.r,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                  fontFamily: 'SF Pro',
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp),
            ),
          ),
        ),
      ),
    );
  }
}
