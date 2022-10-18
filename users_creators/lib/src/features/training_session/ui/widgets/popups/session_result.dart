import 'dart:ui';
import 'package:components/buttons/app_buttons.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/popups/first_bloc_result.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/popups/second_bloc_result.dart';

import 'great_job.dart';

class SessionResultDialog extends StatelessWidget {
  const SessionResultDialog({Key? key}) : super(key: key);

    void showResult(BuildContext context) {
    showDialog(
        useSafeArea: false,
        context: context,
        builder: (context) {
          return Container(
              height: MediaQuery.of(context).size.height,
              color: const Color(0xFF142A4B).withOpacity(0.25),
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                  child: const Center(child: GreatJob())));
        });
  }




  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: SingleChildScrollView(
        child: AlertDialog(
          insetPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          contentPadding: EdgeInsets.only(top: 7.r, bottom: 3.r),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/training_session/coach_photo.png',
                        height: 40.r,
                      ),
                      SizedBox(
                        width: 10.r,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Coach Name',
                              style: TextStyle(
                                  fontFamily: "SF Pro",
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: ColorsLimitless.textColor),
                            ),
                            SizedBox(
                              height: 5.r,
                            ),
                            Text(
                              'My Fitness Journey',
                              style: TextStyle(
                                  fontFamily: "SF Pro",
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  color: ColorsLimitless.greyMedium),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            child: SvgPicture.asset(
                                'assets/icons/training_session/close.svg'),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(
                            height: 15.r,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.r,),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: const Color(0xFFF7F9FB),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            '10,500',
                            style: TextStyle(
                                fontFamily: "SF Pro",
                                fontSize: 24.sp,
                                color: ColorsLimitless.brandColor,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w800),
                          ),
                          SizedBox(
                            height: 10.r,
                          ),
                          Text(
                            'VOLUME (KG)',
                            style: TextStyle(
                                letterSpacing: 0.5,
                                fontFamily: "SF Pro",
                                fontSize: 11.sp,
                                color: ColorsLimitless.greyMedium,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.r,
                  ),
                  const FirstBloc(),
                  SizedBox(
                    height: 15.r,
                  ),
                  const SecondBloc(),
                  SizedBox(height: 22.r,),
                  AppButtons().redButton(context, 'Complete', () {
                  Navigator.pop(context);
                  showResult(context);
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

