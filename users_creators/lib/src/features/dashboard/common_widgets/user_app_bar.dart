import 'package:auto_route/auto_route.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/settings/presentation/profile/domain/profile.dart';
import 'package:users_creators/src/features/settings/presentation/profile/repo/profile_repo.dart';

class UserAppBar extends StatelessWidget {
  Profile? profile = ProfileRepo().getProfileData();
  UserAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.r, vertical: 10.r),
          child: Row(
            children: [
              Container(
                height: 34.r,
                width: 34.r,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: profile?.avatarUrl! == null
                    ? Container(
                        height: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorsLimitless.greyLight.withOpacity(0.3)),
                        child: SvgPicture.asset(
                          'assets/icons/settings/camera.svg',
                          color: Colors.black,
                          height: 22.r,
                        ),
                      )
                    : Container(
                        height: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  profile!.avatarUrl!,
                                ))),
                      ),
              ),
              SizedBox(
                width: 10.r,
              ),
              Text('${profile?.firstName} ${profile?.lastName}',
                  style: TextStyle(
                      color: ColorsLimitless.greyDark,
                      fontSize: 22.sp,
                      fontFamily: "SF Pro",
                      fontWeight: FontWeight.w700)),
              const Expanded(child: SizedBox()),
              GestureDetector(
                child: SvgPicture.asset(
                  'assets/icons/dashboard/settings.svg',
                  height: 22.sp,
                  color: Colors.black,
                ),
                onTap: () {
                  context.router.pushNamed('/user-profile-page');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
