import 'package:components/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NoSessionWidget extends StatelessWidget {
  const NoSessionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: [
          const Expanded(child: SizedBox()),
          Text(
            'No scheduled workouts for this day',
            style: TextStyle(
                color: ColorsLimitless.greyLight,
                fontFamily: 'SF Pro',
                letterSpacing: 0.5,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.45),
            child: SvgPicture.asset('assets/icons/session/arrow.svg',
                height: 25.h, color: ColorsLimitless.greyLight.withOpacity(0.4)),
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: 20.h,
                right: MediaQuery.of(context).size.width * 0.3,
                left: MediaQuery.of(context).size.width * 0.2),
            child: Text(
              'Tap the plus button to add your own workout from your library for today!',
              style: TextStyle(
                  color: ColorsLimitless.greyLight,
                  fontFamily: 'SF Pro',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
