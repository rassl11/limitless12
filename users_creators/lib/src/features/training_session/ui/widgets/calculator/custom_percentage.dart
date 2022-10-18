import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users_creators/src/features/training_session/bloc/calculator/custom_percent_cubit.dart';

class CustomPersentage extends StatelessWidget {
  const CustomPersentage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomPercentCubit, int>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: Text(
                'Custom Persantage',
                style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorsLimitless.textColor),
              ),
            ),
            GestureDetector(
              child:
                  SvgPicture.asset('assets/icons/training_session/minus.svg'),
              onTap: () {
                context.read<CustomPercentCubit>().decrement();
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.r),
              child: Container(
                width: 70.r,
                height: 42.r,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFE4E6EA)),
                    borderRadius: BorderRadius.circular(6.r)),
                child: Center(
                  child: Text(
                    '$state%',
                    style: TextStyle(
                        letterSpacing: 0.5,
                        fontFamily: "SF Pro",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        color: ColorsLimitless.textColor),
                  ),
                ),
              ),
            ),
            GestureDetector(
              child: SvgPicture.asset('assets/icons/training_session/plus.svg'),
              onTap: () {
              context.read<CustomPercentCubit>().increment();
              },
            ),
          ],
        );
      },
    );
  }
}
