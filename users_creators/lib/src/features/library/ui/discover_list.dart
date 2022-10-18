import 'package:avatar_view/avatar_view.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users_creators/src/features/creator/bloc/creator/creator_bloc.dart';
import 'package:users_creators/src/features/creator/bloc/creator/creator_event.dart';
import 'package:users_creators/src/features/creator/bloc/subscribe/user_subscribe_bloc.dart';
import 'package:users_creators/src/features/creator/bloc/subscribe/user_subscribe_event.dart';
import 'package:users_creators/src/features/creator/bloc/subscribe/user_subscribe_state.dart';
import 'package:users_creators/src/features/current_creator/current_creator_bloc.dart';
import 'package:users_creators/src/features/current_creator/current_creator_event.dart';
import 'package:users_creators/src/features/followed/domain/followed.dart';

// ignore: must_be_immutable
class DiscoverListWidget extends StatefulWidget {
  DiscoverListWidget({Key? key, required this.index, required this.followed}) : super(key: key);
  int index;
  final List<AllFollowed> followed;

  @override
  State<DiscoverListWidget> createState() => _DiscoverListWidgetState();
}

class _DiscoverListWidgetState extends State<DiscoverListWidget> {
  List<int> followStatus = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 13.r),
        child: InkWell(
            child: Ink(
              child: Row(
                children: [
                  AvatarView(
                    radius: 25,
                    avatarType: AvatarType.CIRCLE,
                    backgroundColor: ColorsLimitless.greyDark,
                    imagePath: widget.followed[widget.index].avatarUrl!,
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
                    width: 10.r,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.followed[widget.index].firstName!} ${widget.followed[widget.index].lastName!}",
                        style: TextStyle(fontFamily: 'SF Pro', fontSize: 13.sp, fontWeight: FontWeight.w700, letterSpacing: 0.5),
                      ),
                      SizedBox(
                        height: 3.r,
                      ),
                      Text(
                        widget.followed[widget.index].email ?? 'Empty',
                        style: TextStyle(fontFamily: 'SF Pro', fontSize: 11.sp, color: Color(0xFF777E90), fontWeight: FontWeight.w400, letterSpacing: 0.5),
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  SvgPicture.asset(
                    followStatus.contains(widget.index) ? 'assets/icons/creator/alarm.svg' : 'assets/icons/creator/alarm_red.svg',
                    height: 19.r,
                  ),
                  SizedBox(
                    width: 30.r,
                  ),
                  GestureDetector(
                    child: Text(
                      followStatus.contains(widget.index) ? 'Follow' : "Unfollow",
                      style:
                          TextStyle(fontFamily: 'SF Pro', fontSize: 11.5.sp, color: const Color(0xFF353945), fontWeight: FontWeight.w600, letterSpacing: 0.5),
                    ),
                    onTap: () {
                      UserSubscribeState.changeUserId(widget.followed[widget.index].id);
                      if (followStatus.contains(widget.index)) {
                        followStatus.remove(widget.index);
                        context.read<UserSubscribeBloc>().add(FollowEvent());
                      } else {
                        followStatus.add(widget.index);
                        context.read<UserSubscribeBloc>().add(UnFollowEvent());
                      }
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
            onTap: () {
              context.read<CreatorProfileBloc>().add(CurrentCreatorProfileLoadEvent(widget.followed[widget.index].id!));
              context.read<CurrentCreatorBloc>().add(SetCurrentCreatorEvent(widget.followed[widget.index].id!));
              Navigator.pop(context);
            }));
  }
}
