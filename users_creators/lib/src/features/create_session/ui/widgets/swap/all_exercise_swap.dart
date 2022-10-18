import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AllExerciseSwap extends StatelessWidget {
  final Function onTapInfo;
  
  const AllExerciseSwap({Key? key,required this.onTapInfo}) : super(key: key);
   


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(6)),
          child: Padding(
            padding: EdgeInsets.all(8.r),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: Image.asset(
                    'assets/images/create_session/exercise.png',
                    height: 30.r,
                    width: 37.r,
                  ),
                ),
                SizedBox(
                  width: 9.r,
                ),
                Text(
                  'Leg Press',
                  style: TextStyle(
                      color: ColorsLimitless.greyDark,
                      fontFamily: 'SF Pro',
                      letterSpacing: 0.5,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500),
                ),
                const Expanded(child: SizedBox()),
                GestureDetector(
                  child: SvgPicture.asset(
                    'assets/icons/create_session/info.svg',
                    color: ColorsLimitless.greyDark,
                    height: 18.r,
                  ),
                  onTap: () {
                    onTapInfo();
                  },
                ),
                SizedBox(
                  width: 5.r,
                ),
              ],
            ),
          )),
    );
  }
}
