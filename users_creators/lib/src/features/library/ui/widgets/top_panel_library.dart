import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopPanelLibrary extends StatelessWidget {
  const TopPanelLibrary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 30.r,
        ),
        const Expanded(child: SizedBox()),
        Expanded(
          child: Text(
            'Library',
            style: TextStyle(
                fontFamily: 'SF Pro',
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: 1),
          ),
        ),
        const Expanded(child: SizedBox())
      ],
    );
    ;
  }
}
