import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DaysWorkouts extends StatelessWidget {
  const DaysWorkouts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _rowItem(root: 0, value: 30.toString()),
        _rowItem(root: 1, value: 20.toString()),
      ],
    );
  }

  Widget _rowItem({
    required int root,
    required String value,
  }) =>
      Expanded(
        child: Container(
          height: 67.h,
          decoration: BoxDecoration(
            color: const Color(0xffF7F9FB),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    root == 0 ? 'Days' : 'Workouts',
                    style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontSize: 14.sp,
                      color: const Color(0xff777E91),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    value,
                    style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontSize: 30.sp,
                      color: const Color(0xff353945),
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
