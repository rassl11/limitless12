import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';



class PopupInfo extends StatelessWidget {
  const PopupInfo({Key? key, required this.onPressedInfo}) : super(key: key);
  final VoidCallback onPressedInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF142A4B).withOpacity(0.35),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.r),
        child: Center(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                child: GestureDetector(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Stack(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              color: Colors.white),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 18.r, vertical: 22.r),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Grow (Recommanded)',
                                        style: TextStyle(
                                          fontFamily: "SF Pro",
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF23262F),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 18.r,
                                  ),
                                  SizedBox(
                                    width: 0.75.sw,
                                    child: Text(
                                      '''We recommand the “Grow” route because we have a better monetaztion tools for you avaiable in the near future, such as:''',
                                      style: TextStyle(
                                        fontFamily: "SF Pro",
                                        fontSize: 14.sp,
                                        letterSpacing: 0.5,
                                        height: 1.5,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF353945),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14.r,
                                  ),
                                  SizedBox(
                                    width: 0.8.sw,
                                    child: Text(
                                      '''1.  Create your own library of fitness content and monetize it.''',
                                      style: TextStyle(
                                        fontFamily: "SF Pro",
                                        fontSize: 14.sp,
                                        height: 1.5,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF777E90),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14.r,
                                  ),
                                  SizedBox(
                                    width: 0.8.sw,
                                    child: Text(
                                      '''2.  You will be able to sell training program tamplates via your Limitless store.''',
                                      style: TextStyle(
                                        fontFamily: "SF Pro",
                                        fontSize: 14.sp,
                                        letterSpacing: 0.5,
                                        height: 1.5,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF777E90),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14.r,
                                  ),
                                  SizedBox(
                                      width: 0.8.sw,
                                    child: Text(
                                      '''3.  Offer online coaching services trough our platform (for individulas and groups).''',
                                      style: TextStyle(
                                        fontFamily: "SF Pro",
                                        fontSize: 14.sp,
                                        letterSpacing: 0.5,
                                        height: 1.5,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF777E90),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40.r,
                                  ),
                                  GestureDetector(
                                      onTap: onPressedInfo,
                                      child: Container(
                                        height: 0.05.sh,
                                        width: 1.sw,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border: Border.all(
                                              color: Color(0xFFB1B5C3)),
                                        ),
                                        child: Center(
                                            child: Text(
                                          'Got it',
                                          style: TextStyle(
                                              fontFamily: 'SF Pro',
                                              fontSize: 12.sp,
                                              color: Color(0xFF353945),
                                              fontWeight: FontWeight.w500),
                                        )),
                                      ))
                                ]),
                          )),
                      Positioned(
                        top: 15.r,
                        right: 20.r,
                        child: GestureDetector(
                            onTap: onPressedInfo,
                            child: SvgPicture.asset(
                              'assets/icons/workout_popup/close.svg',
                              height: 19.r,
                            )),
                      ),
                    ],
                  )
                ])))),
      ),
    );
  }
}

