import 'package:auto_route/auto_route.dart';
import 'package:avatar_view/avatar_view.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/creator/bloc/creator/creator_bloc.dart';
import 'package:users_creators/src/features/creator/bloc/creator/creator_event.dart';
import 'package:users_creators/src/features/creator/bloc/subscribe/user_subscribe_bloc.dart';
import 'package:users_creators/src/features/creator/bloc/subscribe/user_subscribe_event.dart';
import 'package:users_creators/src/features/discover/bloc/discover_bloc.dart';

class NewCreatorsWidget extends StatelessWidget {
  const NewCreatorsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverBloc, DiscoverState>(builder: (context, state) {
      return state.map(initial: ((value) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 13.r),
              child: Text(
                'New creators'.toUpperCase(),
                style: TextStyle(
                    fontFamily: "SF Pro",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                    color: ColorsLimitless.greyMedium),
              ),
            ),
            SizedBox(
              height: 22.r,
            ),
            SizedBox(
                height: 100.r,
                child: ListView.separated(
                    padding: EdgeInsets.only(right: 13.r, left: 13.r),
                    separatorBuilder: (context, index) => SizedBox(
                          width: 15.r,
                        ),
                    itemCount: value.newCreators.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Column(children: [
                          const AvatarView(
                            radius: 35,
                            avatarType: AvatarType.CIRCLE,
                            backgroundColor: ColorsLimitless.greyDark,
                            imagePath:
                                "https://st2.depositphotos.com/3364363/5972/i/600/depositphotos_59728757-stock-photo-waiting-for-a-new-day.jpg",
                            placeHolder: Icon(
                              Icons.person,
                              size: 40,
                            ),
                            errorWidget: Icon(
                              Icons.error,
                              size: 40,
                            ),
                          ),
                          SizedBox(
                            height: 5.r,
                          ),
                          Text(
                            "${value.newCreators[index].firstName} ${value.newCreators[index].lastName}",
                            style: TextStyle(
                                fontFamily: 'SF Pro',
                                fontSize: 11.sp,
                                color: ColorsLimitless.textColor,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5),
                          ),
                        ]),
                        onTap: () {
                          context.read<UserSubscribeBloc>().add(
                              LoadingFollowersEvent(
                                  value.newCreators[index].id!));
                          context.read<CreatorProfileBloc>().add(
                              CreatorProfileLoadEvent(
                                  value.newCreators[index].id!));
                          context.router.navigateNamed('/creator-page');
                        },
                      );
                    }))
          ],
        );
      }), loading: (val) {
        return const Offstage();
      });
    });
  }
}
