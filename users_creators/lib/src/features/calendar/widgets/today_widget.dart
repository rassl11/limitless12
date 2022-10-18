import 'package:components/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodayWidget extends StatelessWidget {
  final Function onTap;
  const TodayWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 12, bottom: 12),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(
                  width: 1, color: ColorsLimitless.greyLight.withOpacity(0.4))),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.r,
            ),
            child: Center(
              child: Text(
                'Today',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorsLimitless.greyDark),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
