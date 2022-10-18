import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../show_limitedone_dialog.dart';
import '../../../../workout_card.dart';

class ProgramTab2 extends StatelessWidget {
  const ProgramTab2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 30.h,
        bottom: 90.h,
      ),
      child: Column(
        children: List.generate(7, (index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffF7F9FB),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 4.h,
                ),
                child: Text(
                  'Week ${index + 1}',
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Column(
                children: List.generate(3, (index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: WorkoutCardWidget(
                      onTap: index.isEven
                          ? () => showLimitedOneDialog(context)
                          : () => context.router
                              .pushNamed('/workouts-details-page'),
                      isLimitedAccess: index.isEven,
                    ),
                  );
                }),
              ),
            ],
          );
        }),
      ),
    );
  }
}
