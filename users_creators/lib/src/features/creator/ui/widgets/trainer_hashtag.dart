import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../entity/trainer_hashtag_model.dart';

class TrainerHashTagList extends StatelessWidget {
   TrainerHashTagList({ Key? key,required this.index }) : super(key: key);
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(
          color: const Color(0xFFE94359)
        ),
      ),
      child: Center(child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10),
        child: Text(trainerHashTagList[index].hashTag,
        style: TextStyle(
          fontFamily: 'SF Pro',
          color: Color(0xFFE94359),
          fontSize: 11.sp,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w700
        ),
        ),
      )),
    );
  }
}