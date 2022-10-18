import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/settings/presentation/subscription/subscription_expired_bottom_sheet.dart';

import '../subscription_info_bottom_sheet.dart';

class SubscriptionCard extends StatelessWidget {
  final String image;
  final String name;
  final bool isSubscribed;
  final String subscriptionPeriod;

  const SubscriptionCard(
      {Key? key,
      required this.image,
      required this.name,
      required this.isSubscribed,
      required this.subscriptionPeriod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          showModalBottomSheet(
            isScrollControlled: true,
            isDismissible: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            context: context,
            builder: (_) {
              return isSubscribed ? const SubscriptionInfoBottomSheet() : const SubscriptionExpiredInfoBottomSheet() ;
            },
          );
        },
        child: Row(
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
                  isSubscribed ?
                  'Subscription ends $subscriptionPeriod' : 'Total month Subscribed: $subscriptionPeriod',
                  style: TextStyle(
                      color: ColorsLimitless.greyLight,
                      fontFamily: 'SF Pro',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
