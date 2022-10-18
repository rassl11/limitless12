import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/training_session/entity/set_history_model.dart';

class SuperSetList extends StatelessWidget {
  const SuperSetList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 14.r,vertical: 20.r),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: setHistoryList.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding:  EdgeInsets.only(bottom: 14.r),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.r)
              ),
              padding: EdgeInsets.symmetric(horizontal: 14.r,vertical: 18.r),
            
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(setHistoryList[index].date,
                  style: TextStyle(
                    fontFamily: "SF Pro",
                    fontSize: 12.sp,
                    color: ColorsLimitless.textColor,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.7
                  ),
                  ),
                  SizedBox(height: 12.r,),
                  Text(setHistoryList[index].status,
                  style: TextStyle(
                    fontFamily: "SF Pro",
                    fontSize: 12.sp,
                    color: Color(0xFF1BB266),
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.7
                  ),),

                ],
              ),
            ),
          );
        },
        
      ),
    );
  }
}