import 'package:auto_route/auto_route.dart';
import 'package:avatar_view/avatar_view.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/create_session/bloc/create_session/create_session_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/create_session/create_session_event.dart';
import 'package:users_creators/src/features/library/bloc/my_sessions/my_sessions_bloc.dart';
import 'package:users_creators/src/features/library/bloc/my_sessions/my_sessions_event.dart';
import 'package:users_creators/src/features/settings/presentation/profile/domain/profile.dart';
import 'package:users_creators/src/features/settings/presentation/profile/repo/profile_repo.dart';

// ignore: must_be_immutable
class SessionTopPanel extends StatefulWidget {
  final bool isEditing;
  final String name;
  final BuildContext baseContext;

  SessionTopPanel({
    Key? key,
    required this.baseContext,
    required this.isEditing,
    required this.name,
  }) : super(key: key) {
    profile = ProfileRepo().getProfileData();
  }
  Profile? profile = ProfileRepo().getProfileData();

  @override
  State<SessionTopPanel> createState() => _SessionTopPanelState();
}

class _SessionTopPanelState extends State<SessionTopPanel> {
  void onSuccess() {
    ScaffoldMessenger.of(widget.baseContext).showSnackBar(
      SnackBar(
        content: Text(
          "Session successfully ${widget.isEditing ? 'updated' : 'created'}",
        ),
        backgroundColor: Colors.green,
      ),
    );

    widget.baseContext.read<MySessionsTemplatesBloc>().add(LoadSessionTemplatesEvent());
    widget.baseContext.router.pop();
  }

  void onError() {
    ScaffoldMessenger.of(widget.baseContext).showSnackBar(
      SnackBar(
        content: Text(
          "Can't ${widget.isEditing ? 'update' : 'create'} session. Please, try again later",
        ),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  void onNotValid(String validationText) {
    ScaffoldMessenger.of(widget.baseContext).showSnackBar(SnackBar(content: Text(validationText)));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: SvgPicture.asset(
            'assets/icons/create_session/left_arrow.svg',
            width: 22.r,
            height: 22.r,
          ),
          onTap: () {
            context.router.navigateBack();
          },
        ),
        SizedBox(
          width: 8.r,
        ),
        AvatarView(
          radius: 17,
          avatarType: AvatarType.CIRCLE,
          backgroundColor: ColorsLimitless.greyDark,
          imagePath: widget.profile?.avatarUrl ?? '',
          placeHolder: const Icon(
            Icons.person,
            size: 30,
          ),
          errorWidget: const Icon(
            Icons.error,
            size: 30,
          ),
        ),
        SizedBox(
          width: 15.r,
        ),
        Expanded(
          child: TextFormField(
            controller: widget.isEditing ? TextEditingController(text: widget.name) : null,
            onChanged: (value) {
              context.read<CreateSessionBloc>().add(NameSetEvent(name: value));
            },
            autofocus: true,
            cursorColor: ColorsLimitless.textColor,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFB1B5C3)),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFB1B5C3)),
              ),
              hintText: 'User\'s Session Name',
              hintStyle: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 14.sp,
                  letterSpacing: 0.5,
                  color: ColorsLimitless.greyLight,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        SizedBox(
          width: 15.r,
        ),
        Material(
          borderRadius: BorderRadius.circular(6.r),
          child: InkWell(
            borderRadius: BorderRadius.circular(6.r),
            splashFactory: InkRipple.splashFactory,
            splashColor: ColorsLimitless.brandColor,
            onTap: () {
              context.read<CreateSessionBloc>().add(
                    CreateSessionEvent(
                      onNotValid: onNotValid,
                      onSuccess: onSuccess,
                      onError: onError,
                      isEditing: widget.isEditing,
                    ),
                  );
            },
            child: Ink(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r), color: ColorsLimitless.brandColor),
              child: Padding(
                padding: EdgeInsets.fromLTRB(14.r, 6.r, 14.r, 6.r),
                child: Text(
                  widget.isEditing ? 'Save' : 'Done',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "SF Pro",
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w500,
                      fontSize: 11.sp),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
