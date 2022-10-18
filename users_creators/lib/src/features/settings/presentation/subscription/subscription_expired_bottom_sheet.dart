import 'package:components/buttons/app_buttons.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/settings/presentation/subscription/widgets/subscription_header.dart';

class SubscriptionExpiredInfoBottomSheet extends StatelessWidget {
  const SubscriptionExpiredInfoBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SubscriptionHeader(title: 'Expired Subs', isPop: false,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 15.0,
                            backgroundImage: NetworkImage(
                                'https://thumbs.dreamstime.com/b/handsome-shirtless-sweaty-sportsman-training-dumbbells-gym-handsome-shirtless-sweaty-sportsman-training-dumbbells-154829245.jpg'),
                            backgroundColor: Colors.transparent,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'Anthony Teixeira',
                            style: TextStyle(
                                color: ColorsLimitless.greyDark,
                                fontFamily: 'SF Pro',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/settings/calendar.svg',
                            color: ColorsLimitless.brandColor,
                            height: 20.r,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Subscription History',
                                style: TextStyle(
                                    color: ColorsLimitless.greyDark,
                                    fontFamily: 'SF Pro',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                'Total month Subscribed: 2 Month',
                                style: TextStyle(
                                    color: ColorsLimitless.greyMedium,
                                    fontFamily: 'SF Pro',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(padding: const EdgeInsets.all(16),
              child: AppButtons().redButton(context, 'Resubscribe', (){}),
            )

          ],
        ));
  }


}
