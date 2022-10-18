import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users_creators/src/features/creator/bloc/subscribe/user_subscribe_bloc.dart';
import 'package:users_creators/src/features/creator/bloc/subscribe/user_subscribe_event.dart';
import 'package:users_creators/src/features/creator/bloc/subscribe/user_subscribe_state.dart';
import 'package:users_creators/src/features/current_creator/current_creator_bloc.dart';
import 'package:users_creators/src/features/current_creator/current_creator_event.dart';

import '../../bloc/dropdown/user_drop_down_bloc.dart';
import '../../bloc/dropdown/user_drop_down_event.dart';
import '../../bloc/dropdown/user_drop_down_state.dart';

// ignore: must_be_immutable
class MessageLine extends StatefulWidget {
  MessageLine(
      {Key? key,
      required this.userId,
      required this.followStatus,
      required this.instagram,
      required this.tikTok,
      required this.youtube})
      : super(key: key);

  final String userId;
  bool? followStatus;
  String? instagram;
  String? youtube;
  String? tikTok;

  @override
  State<MessageLine> createState() => _MessageLineState();
}

class _MessageLineState extends State<MessageLine> {
  @override
  void initState() {
    if (widget.followStatus == false) {
      UserSubscribeState.changeFollow('Follow');
    } else {
      UserSubscribeState.changeFollow('Unfollow');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final blocPopup = context.read<UserDropDownBloc>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.r),
      child: Stack(
        children: [
          BlocBuilder<UserDropDownBloc, UserDropDownState>(
            builder: (context, stateDropDown) {
              return Row(
                children: [
                  Expanded(
                      child: UserSubscribeState.follow == 'Follow'
                          ? GestureDetector(
                              child: Container(
                                width: 190.r,
                                height: 35.r,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE94359),
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                child: Center(
                                    child: Text(
                                  'Follow',
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      color: const Color(0xFFFCFCFD),
                                      fontFamily: 'SF Pro',
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.w500),
                                )),
                              ),
                              onTap: () {
                                UserSubscribeState.changeUserId(widget.userId);
                                BlocProvider.of<UserSubscribeBloc>(context)
                                    .add(FollowEvent());
                                BlocProvider.of<CurrentCreatorBloc>(context)
                                    .add(SetCurrentCreatorEvent(widget.userId));
                                UserSubscribeState.changeFollow('Unfollow');
                              },
                            )
                          : GestureDetector(
                              child: Container(
                                width: 190.r,
                                height: 35.r,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xFFE6E8EC)),
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                child: Center(
                                    child: Text(
                                  'Unfollow',
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      color: ColorsLimitless.textColor,
                                      fontFamily: 'SF Pro',
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.w500),
                                )),
                              ),
                              onTap: () {
                                UserSubscribeState.changeUserId(widget.userId);
                                BlocProvider.of<UserSubscribeBloc>(context)
                                    .add(UnFollowEvent());
                                BlocProvider.of<CurrentCreatorBloc>(context)
                                    .add(
                                        SetLastFollowedAsCurrentCreatorEvent());
                                UserSubscribeState.changeFollow('Follow');
                              },
                            )),
                  widget.youtube == '' &&
                          widget.tikTok == '' &&
                          widget.instagram == ''
                      ? const SizedBox()
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7.r),
                          child: GestureDetector(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 9.r, vertical: 8.r),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xFFE6E8EC)),
                                    borderRadius: BorderRadius.circular(6.r)),
                                child: SvgPicture.asset(
                                  'assets/icons/creator/instagram.svg',
                                  height: 19.r,
                                ),
                              ),
                              onTap: () {
                                if (stateDropDown is ShowSocialMediaState) {
                                  blocPopup.add(UserCloseSocialMediaEvent());
                                }
                                if (stateDropDown is ShowAboutState) {
                                  blocPopup.add(UserOpenSocialMediaEvent());
                                }
                                if (stateDropDown is ClosedPopup) {
                                  blocPopup.add(UserOpenSocialMediaEvent());
                                }
                              }),
                        ),
                  GestureDetector(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.r, vertical: 8.r),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFE6E8EC)),
                          borderRadius: BorderRadius.circular(6.r)),
                      child: SvgPicture.asset(
                        'assets/icons/creator/settings.svg',
                        color: const Color(0xFF353945),
                        height: 20.r,
                      ),
                    ),
                    onTap: () {
                      if (stateDropDown is ShowSocialMediaState) {
                        blocPopup.add(UserOpenAboutEvent());
                      }
                      if (stateDropDown is ShowAboutState) {
                        blocPopup.add(UserCloseAboutEvent());
                      }
                      if (stateDropDown is ClosedPopup) {
                        blocPopup.add(UserOpenAboutEvent());
                      }
                    },
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
