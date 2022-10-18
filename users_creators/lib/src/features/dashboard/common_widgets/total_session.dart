import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/dashboard/common_widgets/user_session_list.dart';
import '../bloc/get_session_range/get_session_range_state.dart';


class TotalSession extends StatelessWidget {
  const TotalSession({ Key? key,required this.rangeState }) : super(key: key);
  final GotSessionRangeState rangeState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 18.r),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: Colors.white,
        ),
  
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 20.r),
          child:  UserSessionList(summaryState: rangeState,),
        )
        
      ),
    );
  }
}