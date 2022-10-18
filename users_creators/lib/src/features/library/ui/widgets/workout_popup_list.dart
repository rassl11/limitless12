import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/library/entity/model/library/workout_popup.dart';


class WorkOutPopupList extends StatelessWidget {
   WorkOutPopupList({Key? key,required this.index}) : super(key: key);
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
        child: Column(
          children: [
            SizedBox(
              height: 15.r,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFE6E8EC)),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Stack(
                children: [
                  Row(
                    children: [
                      Container(
                          height: 100.r,
                          width: 20.r,
                          decoration: BoxDecoration(
                              color: const Color(0xFF353945),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5.r),
                                  bottomLeft: Radius.circular(5.r))),
                          child: Center(
                              child: RotatedBox(
                            quarterTurns: workOutPopup[index].number.length == 1 ? 0 : 3,
                            child: Text(
                              workOutPopup[index].number,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'SF Pro',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.sp),
                            ),
                          ))),
                      SizedBox(
                        width: 11.r,
                      ),
                      Image.asset(
                        workOutPopup[index].image,
                        height: 75.r,
                      ),
                      SizedBox(
                        width: 10.r,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            workOutPopup[index].title.join(),
                            style: TextStyle(
                                fontFamily: 'SF Pro',
                                fontSize: 16.sp,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 8.r,
                          ),
                          Text(
                            workOutPopup[index].subtitle.join(),
                            style: TextStyle(
                                fontFamily: 'SF Pro',
                                fontSize: 13.sp,
                                letterSpacing: 1,
                                color: const Color(0xFFB1B5C3)),
                          ),
                          SizedBox(
                            height: 24.r,
                          )
                        ],
                      ),
                    ],
                  ),
              
                ],
              ),
            )
          ],
        ));
  }
}
