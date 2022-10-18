import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/get_session_range/get_session_range_state.dart';

class UserSessionList extends StatelessWidget {
  const UserSessionList({Key? key, required this.summaryState}) : super(key: key);
  final GotSessionRangeState summaryState;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              'SESSIONS',
              style: TextStyle(fontSize: 13.sp, fontFamily: 'SF Pro', color: ColorsLimitless.greyMedium, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8.r,
            ),
            Text(
              '${summaryState.getSummary.sessionCount ?? 0}',
              style: TextStyle(
                  fontSize: 23.sp,
                  fontFamily: 'SF Pro',
                  color: ColorsLimitless.textColor,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic),
            )
          ],
        ),
        SizedBox(
          width: 30.r,
        ),
        Column(
          children: [
            Text(
              'VOLUME (KG)',
              style: TextStyle(fontSize: 13.sp, color: ColorsLimitless.greyMedium, fontFamily: 'SF Pro', fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8.r,
            ),
            Text(
              '${summaryState.getSummary.weight ?? 0}',
              style: TextStyle(
                  fontSize: 23.sp,
                  color: ColorsLimitless.textColor,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic),
            )
          ],
        ),
        SizedBox(
          width: 30.r,
        ),
        Column(
          children: [
            Text(
              'REPS',
              style: TextStyle(color: ColorsLimitless.greyMedium, fontSize: 13.sp, fontFamily: 'SF Pro', fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8.r,
            ),
            Text(
              '${summaryState.getSummary.reps ?? 0}',
              style: TextStyle(
                  fontSize: 23.sp,
                  fontFamily: 'SF Pro',
                  color: ColorsLimitless.textColor,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic),
            )
          ],
        ),
      ],
    );
  }
}
