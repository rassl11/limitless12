import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JoinLimitlessPage extends StatefulWidget {
  const JoinLimitlessPage({Key? key}) : super(key: key);

  @override
  State<JoinLimitlessPage> createState() => _JoinLimitlessPageState();
}

class _JoinLimitlessPageState extends State<JoinLimitlessPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(child: SizedBox()),
          Text(
            'Join Limitless One',
            style: TextStyle(
              fontSize: 28.sp,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w800,
              fontFamily: "SF Pro",
              color: const Color(0xff141416),
            ),
          ),
          SizedBox(height: 8.r),
          Text(
            'Monetize your Fitness Content and build your audience!  Every time a user subscribers, you receive their payment.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              fontFamily: "SF Pro",
              height: 1.4,
              color: const Color(0xff777E91),
            ),
          ),
          const Expanded(child: SizedBox())
        ],
      ),
    );
  }
}
