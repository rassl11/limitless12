import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:components/common_widgets/confirm_dialog.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/library/bloc/my_sessions/my_sessions_bloc.dart';
import 'package:users_creators/src/features/library/bloc/my_sessions/my_sessions_event.dart';

import '../../../../../core/config/router.dart';
import '../../../entity/domain/template_model.dart';

class TemplateSettings extends StatelessWidget {
  const TemplateSettings({
    Key? key,
    required this.sessionId,
    required this.baseContext,
    required this.template,
  }) : super(key: key);

  final BuildContext baseContext;
  final String sessionId;
  final TemplateModel template;

  Future confirm({
    required BuildContext context,
    required String title,
    required String subTitle,
    required String cancelButton,
    required String confirmButton,
    required Function onConfirm,
  }) async {
    return showDialog(
        useSafeArea: false,
        context: context,
        builder: (context) {
          return Container(
            height: 190.r,
            color: const Color(0xFF142A4B).withOpacity(0.25),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                child: ConfirmDialog(
                  subTitle: subTitle,
                  title: title,
                  onConfirm: onConfirm,
                  cancelButton: cancelButton,
                  confirmButton: confirmButton,
                )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.2,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            settingsItem('Edit session', () {
              context.router.navigate(
                MainFlowRoute(
                  isEditing: true,
                  sessionTemplateId: sessionId,
                ),
              );
              Navigator.pop(context);
            }),
            SizedBox(
              height: 7.r,
            ),
            const Divider(
              color: ColorsLimitless.greyLight,
              thickness: 0.2,
            ),
            SizedBox(
              height: 7.r,
            ),
            settingsItem('Copy session', () {
              Navigator.pop(context);
              confirm(
                context: baseContext,
                title: 'Copy session',
                subTitle:
                    'Are you sure that you want to copy the session template?',
                onConfirm: () {
                  baseContext
                      .read<MySessionsOptionsBloc>()
                      .add(CopySessionEvent(
                          sessionId: sessionId,
                          onSuccess: () {
                            ScaffoldMessenger.of(baseContext).showSnackBar(
                              SnackBar(
                                backgroundColor: ColorsLimitless.textColor,
                                content: Text(
                                  'Session template copied',
                                  style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontSize: 12.sp,
                                      color: Colors.white),
                                ),
                              ),
                            );
                            baseContext
                                .read<MySessionsTemplatesBloc>()
                                .add(LoadSessionTemplatesEvent());
                          },
                          onError: () {}));
                },
                cancelButton: 'Cancel',
                confirmButton: 'Copy',
              );
            }),
            SizedBox(
              height: 7.r,
            ),
            const Divider(
              color: ColorsLimitless.greyLight,
              thickness: 0.2,
            ),
            SizedBox(
              height: 7.r,
            ),
            settingsItem('Delete session', () async {
              Navigator.pop(context);
              confirm(
                context: baseContext,
                title: 'Delete session',
                subTitle:
                    'Are you sure that you want to delete the session template?',
                onConfirm: () {
                  baseContext
                      .read<MySessionsOptionsBloc>()
                      .add(DeleteSessionEvent(
                          sessionId: sessionId,
                          onSuccess: () {
                            ScaffoldMessenger.of(baseContext).showSnackBar(
                              SnackBar(
                                backgroundColor: ColorsLimitless.textColor,
                                content: Text(
                                  'Session template deleted',
                                  style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontSize: 12.sp,
                                      color: Colors.white),
                                ),
                              ),
                            );
                            baseContext
                                .read<MySessionsTemplatesBloc>()
                                .add(LoadSessionTemplatesEvent());
                          },
                          onError: () {}));
                },
                cancelButton: 'Cancel',
                confirmButton: 'Delete',
              );
            }, color: ColorsLimitless.brandColor),
          ],
        ),
      ),
    );
  }
}

Widget settingsItem(String text, Function onPressed,
    {Color color = ColorsLimitless.greyDark}) {
  return GestureDetector(
      onTap: () => onPressed(),
      child: Text(text,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
            fontFamily: 'SF Pro',
            fontSize: 14.sp,
          )));
}
