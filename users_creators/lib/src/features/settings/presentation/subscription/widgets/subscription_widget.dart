import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../subscription_bottom_sheet.dart';

class SubscriptionWidget extends StatelessWidget {
  final bool isSubscribed;

  const SubscriptionWidget({Key? key, required this.isSubscribed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.r, vertical: 12.r),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 8.w,
              ),
              SvgPicture.asset(
                'assets/icons/top_panel/lightning.svg',
                height: 32.r,
              ),
              SizedBox(
                width: 13.w,
              ),
              isSubscribed
                  ? SizedBox(
                      width: 200.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 4),
                            child: Text(
                              'Subscribed',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'SF Pro',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Pay attention version (your subscription has expired)',
                              style: TextStyle(
                                  color: ColorsLimitless.greyLight,
                                  fontFamily: 'SF Pro',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    )
                  : Text(
                      'No Subscription',
                      style: TextStyle(
                          color: ColorsLimitless.greyLight,
                          fontFamily: 'SF Pro',
                          letterSpacing: 0.6,
                          fontSize: 12.5.sp,
                          fontWeight: FontWeight.w800),
                    ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    isDismissible: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    context: context,
                    builder: (_) {
                      return const SubscriptionBottomSheet();
                    },
                  );
                },
                child: Text(
                  'Manage'.toUpperCase(),
                  style: TextStyle(
                      color: ColorsLimitless.brandColor,
                      fontFamily: 'SF Pro',
                      fontSize: 10.sp,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w700),
                )),
          )
        ],
      ),
    );
  }
}
