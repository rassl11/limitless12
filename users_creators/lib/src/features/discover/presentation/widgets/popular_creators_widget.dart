import 'package:auto_route/auto_route.dart';
import 'package:avatar_view/avatar_view.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/creator/bloc/creator/creator_bloc.dart';
import 'package:users_creators/src/features/creator/bloc/creator/creator_event.dart';
import 'package:users_creators/src/features/creator/bloc/subscribe/user_subscribe_bloc.dart';
import 'package:users_creators/src/features/creator/bloc/subscribe/user_subscribe_event.dart';
import 'package:users_creators/src/features/discover/bloc/discover_bloc.dart';

class PopularCreatorsWidget extends StatelessWidget {
  const PopularCreatorsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverBloc, DiscoverState>(builder: (context, state) {
      return state.map(initial: ((value) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 46.r,
            ),
            Padding(
              padding: EdgeInsets.only(left: 13.r),
              child: Text(
                'Popular creators'.toUpperCase(),
                style: TextStyle(color: ColorsLimitless.greyMedium, letterSpacing: 0.5, fontFamily: 'SF Pro', fontSize: 12.sp, fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: 22.r,
            ),
            value.creators.isEmpty
                ? Center(
                    child: Text(
                    'No creators yet...',
                    style: TextStyle(color: ColorsLimitless.greyMedium, letterSpacing: 0.5, fontFamily: 'SF Pro', fontSize: 16.sp, fontWeight: FontWeight.w400),
                  ))
                : SizedBox(
                    height: 100.h,
                    child: ListView.builder(
                        padding: EdgeInsets.only(left: 13.r),
                        scrollDirection: Axis.horizontal,
                        itemCount: value.creators.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 16.r),
                            child: GestureDetector(
                              child: Column(
                                children: [
                                  AvatarView(
                                    radius: 35,
                                    avatarType: AvatarType.CIRCLE,
                                    backgroundColor: ColorsLimitless.greyDark,
                                    imagePath: value.creators[index].avatarUrl!,
                                    placeHolder: const Icon(
                                      Icons.person,
                                      size: 40,
                                    ),
                                    errorWidget: const Icon(
                                      Icons.error,
                                      size: 40,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.r,
                                  ),
                                  Text(
                                    "${value.creators[index].firstName} ${value.creators[index].lastName}",
                                    style: TextStyle(
                                        color: ColorsLimitless.greyDark,
                                        fontFamily: 'SF Pro',
                                        letterSpacing: 0.5,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                              onTap: () {
                                context.read<UserSubscribeBloc>().add(LoadingFollowersEvent(value.creators[index].id!));
                                context.read<CreatorProfileBloc>().add(CreatorProfileLoadEvent(value.creators[index].id!));
                                context.router.navigateNamed('/creator-page');
                              },
                            ),
                          );
                        }),
                  ),
            SizedBox(
              height: value.creators.isEmpty ? 25.h : 5.h,
            ),
          ],
        );
      }), loading: (val) {
        return const Offstage();
      });
    });
  }
}
