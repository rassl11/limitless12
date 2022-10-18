import 'package:auto_route/auto_route.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/creator/bloc/creator/creator_bloc.dart';
import 'package:users_creators/src/features/creator/bloc/creator/creator_event.dart';
import 'package:users_creators/src/features/creator/bloc/subscribe/user_subscribe_bloc.dart';
import 'package:users_creators/src/features/creator/bloc/subscribe/user_subscribe_event.dart';

enum CardSize {
  small,
  large,
}

class CoachCard extends StatelessWidget {
  final String? image;
  final String name;
  final CardSize size;
  final String id;
  final String? title;

  const CoachCard({
    Key? key,
    required this.id,
    required this.title,
    required this.size,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 14.r),
      child: InkWell(
          focusNode: FocusNode(),
          onTap: () {
            context.read<UserSubscribeBloc>().add(LoadingFollowersEvent(id));
            context.read<CreatorProfileBloc>().add(CreatorProfileLoadEvent(id));
            context.router.navigateNamed('/creator-page');
          },
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              image == null || image!.isEmpty
                  ? Container(
                      height: size == CardSize.large ? 260.h : 150.h,
                      width: size == CardSize.large ? 220.w : 150.w,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r), color: ColorsLimitless.greyDark),
                      child: Center(
                        child: Text(
                          'No photo',
                          style: TextStyle(fontFamily: 'SF Pro', fontSize: 12.sp, letterSpacing: 0.5, color: Colors.white),
                        ),
                      ),
                    )
                  : Container(
                      height: size == CardSize.large ? 260.h : 150.h,
                      width: size == CardSize.large ? 220.w : 150.w,
                      decoration:
                          BoxDecoration(image: DecorationImage(image: NetworkImage(image!), fit: BoxFit.cover), borderRadius: BorderRadius.circular(6.r))),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            color: Colors.white,
                            overflow: TextOverflow.fade,
                            fontFamily: 'SF Pro',
                            fontSize: size == CardSize.large ? 16.sp : 12.sp,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        title ?? 'Empty',
                        style:
                            TextStyle(color: Colors.white, fontFamily: 'SF Pro', fontSize: size == CardSize.large ? 12.sp : 10.sp, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
