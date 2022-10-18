import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/settings/presentation/subscription/widgets/subscription_header.dart';

class SubscriptionInfoBottomSheet extends StatelessWidget {
  const SubscriptionInfoBottomSheet({Key? key}) : super(key: key);

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
                const SubscriptionHeader(title: 'Your Subscription', isPop: false,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 20.0,
                            backgroundImage: NetworkImage(
                                'https://thumbs.dreamstime.com/b/handsome-shirtless-sweaty-sportsman-training-dumbbells-gym-handsome-shirtless-sweaty-sportsman-training-dumbbells-154829245.jpg'),
                            backgroundColor: Colors.transparent,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                'Anthony Teixeira',
                                style: TextStyle(
                                    color: ColorsLimitless.greyDark,
                                    fontFamily: 'SF Pro',
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                'Subscription ends 27 Jun 2022' ,
                                style: TextStyle(
                                    color: ColorsLimitless.greyMedium,
                                    fontFamily: 'SF Pro',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          )
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
                                'Subscription Status:',
                                style: TextStyle(
                                    color: ColorsLimitless.greyDark,
                                    fontFamily: 'SF Pro',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: ColorsLimitless.greyLight.withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(6)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                                  child:  Center(
                                    child: Text('Tier 1 Subscription', style: TextStyle(
                                        color: ColorsLimitless.green.withOpacity(0.9),
                                        fontFamily: 'SF Pro',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700),),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                'Total month Subscribed: 2 Month',
                                style: TextStyle(
                                    color: ColorsLimitless.greyMedium,
                                    fontFamily: 'SF Pro',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/settings/alert.svg',
                            color: ColorsLimitless.brandColor,
                            height: 20.r,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'Your subscription expires 27 Jun',
                            style: TextStyle(
                                color: ColorsLimitless.greyDark,
                                fontFamily: 'SF Pro',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('How to cancel', style: TextStyle(
                          color: ColorsLimitless.greyDark,
                          fontFamily: 'SF Pro',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),),
                      SvgPicture.asset(
                        'assets/icons/settings/arrow_right.svg',
                        color: ColorsLimitless.greyMedium,
                        height: 14.r,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text('Your subscription was purchased on',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorsLimitless.greyDark.withOpacity(0.7),
                      fontFamily: 'SF Pro',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text('App Store',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: ColorsLimitless.greyDark,
                        fontFamily: 'SF Pro',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700),),
                ],
              )
            )

          ],
        ));
  }


}