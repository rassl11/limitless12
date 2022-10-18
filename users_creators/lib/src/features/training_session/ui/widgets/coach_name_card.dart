import 'package:avatar_view/avatar_view.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/training_session/bloc/get_session/get_training_session_state.dart';

class CoachNameCard extends StatelessWidget {
  const CoachNameCard({Key? key, required this.state}) : super(key: key);

  final GotTrainingSessionState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 14.r),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6.r)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AvatarView(
            radius: 20.r,
            avatarType: AvatarType.CIRCLE,
            backgroundColor: ColorsLimitless.greyDark,
            imagePath: state.session.userAvatarUrl ?? '',
            placeHolder: Icon(
              Icons.person,
              size: 20.r,
            ),
            errorWidget: Icon(
              Icons.error,
              size: 20.r,
            ),
          ),
          SizedBox(
            width: 10.r,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${state.session.firstName} ${state.session.lastName}',
                style: TextStyle(fontFamily: 'SF Pro', fontSize: 16.sp, color: ColorsLimitless.textColor, fontWeight: FontWeight.w700),
              ),
            ],
          )
        ],
      ),
    );
  }
}
