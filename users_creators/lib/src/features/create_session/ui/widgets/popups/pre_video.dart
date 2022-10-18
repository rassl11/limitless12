import 'dart:ui';

import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PreVideo extends StatelessWidget {
  const PreVideo({Key? key,required this.image,required this.name}) : super(key: key);
  final String? name;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.r),
        height: 285.r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white,
        ),
        width: 0.9.sw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    name == '' || name == null ? 'No name' : name!,
                    style: TextStyle(
                        color: ColorsLimitless.greyDark,
                        fontFamily: 'SF Pro',
                        letterSpacing: 0.5,
                        fontSize: 21.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                GestureDetector(
                  child: SvgPicture.asset(
                    'assets/icons/workout_popup/close.svg',
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
          
            Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(7.r),
                  child: Image.network(
                    image!,
                    errorBuilder: (context, error, stackTrace) {
                      return Text('No photo');
                    },
                    height: 200.r,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
