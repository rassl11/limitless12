import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/create_session/entity/personal_records.dart';

class PersonalRecordList extends StatelessWidget {
   PersonalRecordList({Key? key, required this.index}) : super(key: key);

  int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            '${personalRecordsList[index].set} x ${personalRecordsList[index].reps} @ ${personalRecordsList[index].weight} kg',
            style: TextStyle(
              fontFamily: "SF Pro",
              fontSize: 12.sp,
              color: ColorsLimitless.greyMedium,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
        ),
        Text(
          personalRecordsList[index].date,
          style: TextStyle(
            fontFamily: "SF Pro",
            fontSize: 11.sp,
            color: ColorsLimitless.brandColor,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
