import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/creator/ui/widgets/workout_list.dart';
import '../../../entity/workout_model.dart';
import '../program_card/bottomsheet/show_bottom_sheet.dart';
import '../program_card/program_card.dart';
import '../services_list_item.dart';
import '../show_limitedone_dialog.dart';
import 'widgets/topinticktok.dart/topintiktok.dart';

class TabBarViewCreator extends StatelessWidget {
  const TabBarViewCreator({
    Key? key,
    required TabController tabController,
    this.creatorId,
    this.fullName = '',
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;
  final String? creatorId;
  final String fullName;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF4F5F6),
      child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'Coaching Services',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: const Color(0xFF23262F),
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(
                    height: 166.w,
                    child: ListView.separated(
                      separatorBuilder: (_, __) => SizedBox(width: 16.w),
                      padding: EdgeInsets.symmetric(horizontal: 16.r),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: workoutList.length,
                      itemBuilder: (context, index) {
                        return ServicesListItem(
                          index: index,
                          creatorId: creatorId ?? '',
                          fullName: fullName,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 50.h),
                ],
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        'Workouts category',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: const Color(0xFF23262F),
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    SizedBox(
                      height: 140.h,
                      child: ListView.separated(
                        separatorBuilder: (_, __) => SizedBox(width: 12.w),
                        padding: EdgeInsets.symmetric(horizontal: 16.r),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: workoutList.length,
                        itemBuilder: (context, index) {
                          return WorkoutList(index: index);
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    const TopInTickTokWorkouts(),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                    top: 16.h,
                    bottom: 32.h,
                  ),
                  separatorBuilder: (_, __) => SizedBox(height: 12.h),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ProgramCardWidget(
                      onTap: index.isEven
                          ? () => showLimitedOneDialog(context)
                          : () => showProgramBottomSheet(context, 0),
                      onTapBtn: index.isEven
                          ? () => showLimitedOneDialog(context)
                          : () => showProgramBottomSheet(context, 1),
                      isLimitedAccess: index.isEven,
                    );
                  },
                ),
              ),
            ),
          ]),
    );
  }
}
