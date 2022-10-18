
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Subscribe extends StatelessWidget {
  const Subscribe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.94.sw,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Color(0xFFFFFFFF), Color(0xFFE7E7E7)]),
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.r)),
      child: Stack(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 12.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '"Creator name"',
                style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    fontSize: 18.sp,
                    letterSpacing: 1.5),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Fitness Journey',
                style: TextStyle(
                  fontFamily: "SF Pro",
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                  letterSpacing: 1.2,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                width: 155.r,
                child: Text(
                  'Subscribe to support and enjoy ad-free workouts',
                  style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontSize: 13.sp,
                      color:const Color(0xFF777E90)),
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Material(
                child: InkWell(
                  borderRadius: BorderRadius.circular(6.r),
                  splashFactory: InkRipple.splashFactory,
                  splashColor: Color(0xFFBA4454),
                  child: Ink(
                    width: 0.35.sw,
                    height: 0.04.sh,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: const Color(0xFFE94359)),
                    child: Center(
                      child: Text(
                        'Subscribe \$4.99',
                        style: TextStyle(
                            color: Color(0xFFF4F5F6),
                            fontFamily: "SF Pro",
                            letterSpacing: 1.1,
                            fontWeight: FontWeight.w700,
                            fontSize: 13.sp),
                      ),
                    ),
                  ),
                  onTap: (){},
                ),
              )
            ],
          ),
        ),
        Positioned(
            right: 20.r,
            child: Image.asset(
              'assets/images/corousel/subscribe_dialog.png',
              height: 140.h,
            )),
      ]),
    );
  }
}