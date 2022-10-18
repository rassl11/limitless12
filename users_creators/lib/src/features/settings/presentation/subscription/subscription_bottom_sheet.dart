import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/settings/presentation/subscription/widgets/subscription_card.dart';
import 'package:users_creators/src/features/settings/presentation/subscription/widgets/subscription_header.dart';

class SubscriptionBottomSheet extends StatelessWidget {
  const SubscriptionBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          const SubscriptionHeader(title: 'Your Subscription', isPop: true,),
            DefaultTabController(
                length: 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 50,
                      child: TabBar(
                          splashFactory: NoSplash.splashFactory,
                          unselectedLabelColor: ColorsLimitless.greyLight,
                          indicatorColor: ColorsLimitless.greyDark,
                          labelColor: ColorsLimitless.greyDark,
                          labelStyle: TextStyle(
                              fontFamily: 'SF Pro',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                          tabs: const [
                            Tab(
                              text: 'Active Subs',
                            ),
                            Tab(
                              child: Text('Expired Subs'),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 200,
                      child: TabBarView(children: [
                        SubscriptionCard(
                            image:
                                'https://thumbs.dreamstime.com/b/handsome-shirtless-sweaty-sportsman-training-dumbbells-gym-handsome-shirtless-sweaty-sportsman-training-dumbbells-154829245.jpg',
                            name: 'Anthony Teixeira',
                            isSubscribed: true,
                            subscriptionPeriod: '27 Jun 2022'),
                        SubscriptionCard(
                            image:
                            'https://thumbs.dreamstime.com/b/handsome-shirtless-sweaty-sportsman-training-dumbbells-gym-handsome-shirtless-sweaty-sportsman-training-dumbbells-154829245.jpg',
                            name: 'Anthony Teixeira',
                            isSubscribed: false,
                            subscriptionPeriod: '2 Month'),
                      ]),
                    )
                  ],
                ))
          ],
        ));
  }


}
