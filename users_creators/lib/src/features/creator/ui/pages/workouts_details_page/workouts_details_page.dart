import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/creator/ui/pages/workouts_details_page/widgets/tags_list.dart';

import '../workouts_view_all_page/widgets/appbar.dart';
import 'widgets/coach_instructions.dart';
import 'widgets/upper_info.dart';

class WorkoutsDetailsPage extends StatelessWidget {
  const WorkoutsDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsLimitless.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppBarWidget(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  const UpperInfoBlock(),
                  SizedBox(height: 19.h),
                  const TagsScrollList(),
                  SizedBox(height: 26.h),
                  const CoachInstructions(),
                  SizedBox(height: 24.h),
                  Material(
                    borderRadius: BorderRadius.circular(6.r),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(6.r),
                      splashFactory: InkRipple.splashFactory,
                      child: Ink(
                        padding: EdgeInsets.zero,
                        height: 48.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: const Color(0xffE94359),
                        ),
                        child: Center(
                          child: Text(
                            'Add',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "SF Pro",
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
