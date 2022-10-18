import 'package:auto_route/auto_route.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/core/constants/routes.dart';
import 'package:users_creators/src/features/settings/presentation/settings/bloc/settings_bloc.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc(() {
        context.router.navigateNamed(Routes.userLoginRoot);
      }),
      child: BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: 70.r),
          child: AlertDialog(
            insetPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            contentPadding: const EdgeInsets.only(top: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            content: SizedBox(
              height: 100.h,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Delete account',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontFamily: 'SF Pro', fontSize: 20.sp, letterSpacing: 0.5, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10.r,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Are you sure you want to delete your account?',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontFamily: 'SF Pro', letterSpacing: 0.5, fontSize: 18.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 10.r,
                  ),
                ],
              ),
            ),
            actions: [
              SizedBox(
                height: 35.h,
                width: 140.w,
                child: InkWell(
                  borderRadius: BorderRadius.circular(6.r),
                  splashFactory: InkRipple.splashFactory,
                  splashColor: ColorsLimitless.brandColor,
                  child: Ink(
                    padding: EdgeInsets.zero,
                    height: 0.07.sh,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r), color: ColorsLimitless.brandColor),
                    child: Center(
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.white, fontFamily: "SF Pro Display", fontWeight: FontWeight.w600, fontSize: 14.sp),
                      ),
                    ),
                  ),
                  onTap: () {
                    BlocProvider.of<SettingsBloc>(context).add(const SettingsEvent.deleteAccount());
                  },
                ),
              ),
              SizedBox(
                width: 140.w,
                height: 35.h,
                child: Material(
                  borderRadius: BorderRadius.circular(6.r),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(6.r),
                    child: Ink(
                      padding: EdgeInsets.zero,
                      height: 0.07.sh,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r), border: Border.all(color: ColorsLimitless.greyLight.withOpacity(0.5)), color: Colors.white),
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.black, fontFamily: "SF Pro Display", fontWeight: FontWeight.w600, fontSize: 14.sp),
                        ),
                      ),
                    ),
                    onTap: () {
                      context.router.pop();
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
