import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/onboarding_creator/bloc/creator_onboarding_bloc.dart';

class GrowDialog extends StatefulWidget {
  GrowDialog({Key? key, required this.selected, required this.onTap}) : super(key: key);
  final Function(int) onTap;
  int selected;
  
  

  @override
  State<GrowDialog> createState() => _GrowDialogState();
}

class _GrowDialogState extends State<GrowDialog> {
  List<String> grow = [
    '\$1',
    '\$2.99',
    '\$4.99',
  ];

  

  @override
  Widget build(BuildContext context) {
        return Padding(
              padding: EdgeInsets.only(top: 20.r),
              child: AlertDialog(
                insetPadding: EdgeInsets.zero,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                actionsAlignment: MainAxisAlignment.spaceEvenly,
                contentPadding: const EdgeInsets.only(top: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                content: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.85,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Expanded(child: SizedBox()),
                            InkWell(
                              onTap: (){
                                context.router.pop();
                              },
                              child: SvgPicture.asset(
                                                  'assets/icons/settings/close.svg',
                                                  color: ColorsLimitless.greyLight,
                                                  height: 24.r,
                                                ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Grow',
                              style: TextStyle(
                                  fontFamily: "SF Pro",
                                  fontSize: 26.sp,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 16.r,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: ColorsLimitless.greyMedium,
                                  borderRadius: BorderRadius.circular(6)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'recommended'.toUpperCase(),
                                  style: TextStyle(
                                      fontFamily: "SF Pro",
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                        growText('Build workouts that you know your fans will love'),
                        growText('Increase social media engagement & followers'),
                        growText(
                            'Create a fitness journey accessible to everyone, followers can become subscribers'),
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(
                          'Subscription fee',
                          style: TextStyle(
                              fontFamily: "SF Pro",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                            itemCount: grow.length,
                            itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  widget.onTap(index);
                                  widget.selected = index;
                                });
                              },
                              child: select(context, widget.selected == index, grow[index]));
                          }),
                        )
                      ],
                    ),
                  ),
                ),
                actions: [
                  SizedBox(
                    height: 40.h,
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(6.r),
                      splashFactory: InkRipple.splashFactory,
                      splashColor: ColorsLimitless.brandColor,
                      child: Ink(
                        padding: EdgeInsets.zero,
                        height: 0.07.sh,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            color: ColorsLimitless.brandColor),
                        child: Center(
                          child: Text(
                            'Choose Grow',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Sf",
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp),
                          ),
                        ),
                      ),
                      onTap: () => context.router.pop(),
                    ),
                  )
                ],
              ),
            );
  }

  Widget growText(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/icons/onboarding_creator/tick-square.svg',
            height: 14.r,
            color: ColorsLimitless.greyDark,
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.start,
              textHeightBehavior:
                  const TextHeightBehavior(applyHeightToFirstAscent: false),
              style: TextStyle(
                  height: 1.6,
                  color: ColorsLimitless.greyDark,
                  fontFamily: "Sf",
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp),
            ),
          )
        ],
      ),
    );
  }

  Widget select(BuildContext context, bool pressed, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
            color: ColorsLimitless.greyLight.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              !pressed
                      ? SvgPicture.asset(
                          'assets/icons/onboarding_creator/grey.svg',
                          height: 19.r,
                        )
                      : SvgPicture.asset(
                          'assets/icons/onboarding_creator/ful_red.svg',
                          height: 19.r,
                        ),
              SizedBox(
                width: 20.r,
              ),
              Text(
                text,
                style: TextStyle(
                    color: ColorsLimitless.greyDark,
                    fontFamily: "Sf",
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
