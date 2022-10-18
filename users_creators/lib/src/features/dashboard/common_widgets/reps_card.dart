import 'package:components/theme/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/dashboard/bloc/get_session_range/get_session_range_state.dart';
import 'package:users_creators/src/features/dashboard/common_widgets/hours_bar_charts.dart';
import 'package:users_creators/src/features/dashboard/common_widgets/reps_bar_chart.dart';
import 'package:users_creators/src/features/dashboard/entity/reps_chart_model.dart';
import 'package:users_creators/src/features/dashboard/common_widgets/sepatator.dart';

class RepsCard extends StatelessWidget {
  const RepsCard({Key? key, required this.reps}) : super(key: key);
  final GotSessionRangeState reps;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.r, vertical: 24.r),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Reps',
                  style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontSize: 16.sp,
                      color: ColorsLimitless.greyMedium,
                      fontWeight: FontWeight.w700),
                ),
                const Expanded(child: SizedBox()),
                SizedBox(
                  width: 50.r,
                  child: Text(
                    'Highest',
                    style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontSize: 12.sp,
                        color: ColorsLimitless.greyMedium,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  width: 60.r,
                  child: Text(
                    '${reps.getReps.highest} reps',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontSize: 12.sp,
                        color: ColorsLimitless.textColor,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 6.r,
            ),
            Row(
              children: [
                Text(
                  '${reps.getReps.sum}',
                  style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontSize: 16.sp,
                      color: ColorsLimitless.textColor,
                      fontWeight: FontWeight.w700),
                ),
                const Expanded(child: SizedBox()),
                SizedBox(
                  width: 50.r,
                  child: Text('Last',
                      style: TextStyle(
                          fontFamily: 'SF Pro',
                          fontSize: 12.sp,
                          color: ColorsLimitless.greyMedium,
                          fontWeight: FontWeight.w400)),
                ),
                SizedBox(
                  width: 60.r,
                  child: Text(
                    '${reps.getReps.last} reps',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontSize: 12.sp,
                        color: ColorsLimitless.textColor,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.r,
            ),
            RepsBarChards(
              reps: reps.getReps.repeatsDate ?? [],
            )
          ],
        ),
      ),
    );
  }
}
