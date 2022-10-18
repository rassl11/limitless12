import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final _questions = [
  'Who is this program for?',
  'Why only 10 latest workouts?',
  'At the beginning of each lower body session set up a glute activation circuit to get you all warmed up and a cool down at the end to help with recovery and flexibility?',
];

class ProgramFaq extends StatelessWidget {
  const ProgramFaq({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FAQ',
          style: TextStyle(
            fontFamily: 'SF Pro',
            fontSize: 32.sp,
            color: const Color(0xFF23262F),
            fontWeight: FontWeight.w700,
          ),
        ),
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ListTileTheme(
            contentPadding: const EdgeInsets.all(0),
            horizontalTitleGap: 0,
            child: Column(
              children: List.generate(_questions.length, (index) {
                return ExpansionTile(
                  backgroundColor: Colors.transparent,
                  collapsedBackgroundColor: Colors.transparent,
                  childrenPadding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  tilePadding: EdgeInsets.zero,
                  trailing: Container(
                    width: 32.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffF7F9FB),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(6.r),
                        bottomRight: Radius.circular(6.r),
                      ),
                    ),
                    margin: EdgeInsets.only(top: 12.h),
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.add,
                      size: 16.r,
                      color: const Color(0xFF777E91),
                    ),
                  ),
                  title: Container(
                    height: 37.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffF7F9FB),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6.r),
                        bottomLeft: Radius.circular(6.r),
                      ),
                    ),
                    margin: EdgeInsets.only(top: 12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Text(
                            _questions[index],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: 'SF Pro',
                              fontSize: 14.sp,
                              color: const Color(0xFF777E91),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  children: <Widget>[
                    Text(
                      'At the beginning of each lower body session set up a glute activation circuit to get you all warmed up and a cool down at the end to help with recovery and flexibility.',
                      style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontSize: 13.sp,
                        height: 1.3,
                        color: ColorsLimitless.greyDark,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
