import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users_creators/src/features/training_session/bloc/calculator/wight_cubit.dart';

class HighestWeight extends StatelessWidget {
  const HighestWeight({
    Key? key,
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeightCubit, int>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: Text(
                'Highest Weight',
                style: TextStyle(
                    fontFamily: "SF Pro",
                    color: ColorsLimitless.textColor,
                    fontSize: 14.sp,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w500),
              ),
            ),
            GestureDetector(
              child:
                  SvgPicture.asset('assets/icons/training_session/minus.svg'),
              onTap: () {
                if(state > 0){
                    context.read<WeightCubit>().decrement();
                }
            
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.r),
              child: Container(
                width: 70.r,
                height: 42.r,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFE4E6EA)),
                    borderRadius: BorderRadius.circular(6.r)),
                child: Center(
                  child: Text(
                    '$state',
                    style: TextStyle(
                        fontFamily: "SF Pro",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: ColorsLimitless.textColor),
                  ),
                ),
              ),
            ),
            GestureDetector(
              child: SvgPicture.asset('assets/icons/training_session/plus.svg'),
              onTap: () {
                if(state < 1000){
                    context.read<WeightCubit>().increment();
                }
              
              }
            ),
          ],
        );
      },
    );
  }
}
