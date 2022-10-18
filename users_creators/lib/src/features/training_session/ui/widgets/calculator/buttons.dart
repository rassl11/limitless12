import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculatorButtons extends StatelessWidget {
  const CalculatorButtons({Key? key,}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Material(
            borderRadius: BorderRadius.circular(6.r),
            child: InkWell(
              borderRadius: BorderRadius.circular(6.r),
              child: Ink(
                height: 37.r,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(
                        color: ColorsLimitless.greyLight.withOpacity(0.5)),
                    color: Colors.white),
                child: Center(
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Sf",
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        SizedBox(
          width: 15.r,
        ),
        Expanded(
          child: Material(
            borderRadius: BorderRadius.circular(6.r),
            child: InkWell(
              borderRadius: BorderRadius.circular(6.r),
              child: Ink(
                height: 37.r,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: ColorsLimitless.brandColor),
                child: Center(
                  child: Text(
                    'Save',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Sf",
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}
