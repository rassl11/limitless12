import 'package:avatar_view/avatar_view.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/current_creator/current_creator_bloc.dart';
import 'package:users_creators/src/features/current_creator/current_creator_state.dart';

class DiscoverBottomBarItem extends StatelessWidget {
  final Function onTap;
  final bool isActive;
  final Function? onLongPress;

  const DiscoverBottomBarItem({Key? key, required this.onTap, required this.isActive, required this.onLongPress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentCreatorBloc, CurrentCreatorState>(builder: (context, state) {
      if (state is HaveCurrentCreatorState) {
        return InkWell(
            focusNode: FocusNode(),
            onTap: () => onTap(),
            onLongPress: () => onLongPress!(),
            child: Center(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  isActive ? Colors.transparent : Colors.white,
                  BlendMode.saturation,
                ),
                child: AvatarView(
                  radius: 20,
                  avatarType: AvatarType.CIRCLE,
                  backgroundColor: ColorsLimitless.greyDark,
                  imagePath: state.creatorProfile.avatarUrl!,
                  placeHolder: const Icon(
                    Icons.person,
                    size: 20,
                  ),
                  errorWidget: const Icon(
                    Icons.error,
                    size: 20,
                  ),
                ),
              ),
            ));
      }
      if (state is DoNotHaveCurrentCreatorState) {
        return InkWell(
          focusNode: FocusNode(),
          onTap: () => onTap(),
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/icons/dashboard/discover.svg', color: isActive ? ColorsLimitless.greyDark : ColorsLimitless.greyLight),
              SizedBox(
                height: 7.h,
              ),
              Text(
                'Discover',
                style: TextStyle(fontSize: 13.sp, fontFamily: 'SF Pro', color: isActive ? ColorsLimitless.greyDark : ColorsLimitless.greyLight),
              ),
            ],
          )),
        );
      }
      return const SizedBox.shrink();
    });
  }
}
