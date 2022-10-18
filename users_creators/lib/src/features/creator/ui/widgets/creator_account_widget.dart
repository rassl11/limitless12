import 'package:avatar_view/avatar_view.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/creator/bloc/creator/creator_bloc.dart';
import 'package:users_creators/src/features/creator/bloc/creator/creator_state.dart';
import 'package:users_creators/src/features/creator/bloc/subscribe/user_subscribe_bloc.dart';
import 'package:users_creators/src/features/creator/bloc/subscribe/user_subscribe_state.dart';

class CreatorAccount extends StatelessWidget {
  const CreatorAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserSubscribeBloc, UserSubscribeState>(
      builder: (context, stateFollow) {
        return BlocBuilder<CreatorProfileBloc, CreatorProfileState>(
          builder: (context, state) {
            if (state is LoadedCreatorProfileState) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.r),
                child: SizedBox(
                  height: 80.r,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          AvatarView(
                            radius: 40,
                            avatarType: AvatarType.CIRCLE,
                            backgroundColor: ColorsLimitless.greyDark,
                            imagePath: state.data.avatarUrl!,
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
                            width: 20.r,
                          ),
                          Align(
                            alignment: const FractionalOffset(0, 0.9),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${state.data.followers!}',
                                  style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.5),
                                ),
                                SizedBox(
                                  height: 3.r,
                                ),
                                Text(
                                  'Followers',
                                  style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      color: const Color(0xFF777E90),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.5),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 25.r,
                          ),
                          Align(
                            alignment: const FractionalOffset(0, 0.9),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  state.data.sessions == null
                                      ? '0'
                                      : '${state.data.sessions}', // TODO: set appropriate values
                                  style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.5),
                                ),
                                SizedBox(
                                  height: 3.r,
                                ),
                                Text(
                                  'Workouts',
                                  style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      color: const Color(0xFF777E90),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.7),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 25.r,
                          ),
                          Align(
                            alignment: const FractionalOffset(0, 0.9),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  state.data.sessions == null
                                      ? '0'
                                      : '${state.data.sessions}', // TODO: set appropriate values
                                  style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.5),
                                ),
                                SizedBox(height: 3.r),
                                Text(
                                  'Programs',
                                  style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      color: const Color(0xFF777E90),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.7),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 5.r,
                        left: 90.r,
                        child: Text(
                          // state.data.userName!,
                          '${state.data.firstName} ${state.data.lastName}',
                          style: TextStyle(
                              fontFamily: 'SF Pro',
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w700,
                              fontSize: 20.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}
