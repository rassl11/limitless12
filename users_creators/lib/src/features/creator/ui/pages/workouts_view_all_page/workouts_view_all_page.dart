import 'package:auto_route/auto_route.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/show_limitedone_dialog.dart';
import '../../widgets/workout_card.dart';
import 'widgets/appbar.dart';

class WorkoutsViewAllPage extends StatelessWidget {
  const WorkoutsViewAllPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsLimitless.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const AppBarWidget(),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                top: 16.h,
                bottom: 32.h,
              ),
              separatorBuilder: (_, __) => SizedBox(height: 12.h),
              itemBuilder: (context, index) {
                return WorkoutCardWidget(
                  onTap: index.isEven
                      ? () => showLimitedOneDialog(context)
                      : () =>
                          context.router.pushNamed('/workouts-details-page'),
                  isLimitedAccess: index.isEven,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
