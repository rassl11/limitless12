import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Repetitions extends StatefulWidget {
  const Repetitions({
    Key? key,
  }) : super(key: key);

  @override
  State<Repetitions> createState() => _RepetitionsState();
}

class _RepetitionsState extends State<Repetitions> {
  int rep = 0;

  void plusWeight() {
    if (rep >= 1000) return;
    rep++;
  }

  void minusWeight() {
    if (rep <= 0) return;
    rep--;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Repetitions',
            style: TextStyle(
                fontFamily: "SF Pro",
                color: ColorsLimitless.textColor,
                fontSize: 14.sp,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w500),
          ),
        ),
        GestureDetector(
          child: SvgPicture.asset('assets/icons/training_session/minus.svg'),
          onTap: () {
            minusWeight();
            setState(() {});
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
                '$rep',
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
            plusWeight();
            setState(() {});
          },
        ),
      ],
    );
  }
}
