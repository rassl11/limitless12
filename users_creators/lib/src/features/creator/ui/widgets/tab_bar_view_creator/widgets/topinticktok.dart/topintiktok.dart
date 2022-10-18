import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../show_limitedone_dialog.dart';
import '../../../workout_card.dart';
import 'widgets/head.dart';

class TopInTickTokWorkouts extends StatelessWidget {
  const TopInTickTokWorkouts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          const Head(),
          ListView.separated(
            itemCount: 2,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (_, __) => SizedBox(height: 12.h),
            itemBuilder: (context, index) {
              return WorkoutCardWidget(
                onTap: index.isEven
                    ? () => showLimitedOneDialog(context)
                    : () => context.router.pushNamed('/workouts-details-page'),
                isLimitedAccess: index.isEven,
              );
            },
          ),
        ],
      ),
    );
  }
}
