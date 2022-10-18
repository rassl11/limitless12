import 'dart:ui';

import 'package:components/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/core/widgets/dialogs/date_picker.dart';
import 'package:users_creators/src/features/calendar/session/bloc/session_bloc.dart';
import 'package:users_creators/src/features/library/ui/widgets/template/delete_session_confirm.dart';

class SessionMenu extends StatefulWidget {
  final String sessionId;

  const SessionMenu({Key? key, required this.sessionId}) : super(key: key);

  @override
  State<SessionMenu> createState() => _SessionMenuState();
}

class _SessionMenuState extends State<SessionMenu> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240.h,
      child: Column(
        children: [
          SizedBox(
            height: 12.h,
          ),
          SvgPicture.asset(
            'assets/icons/settings/divider.svg',
            color: ColorsLimitless.backgroundColor,
            height: 6.r,
          ),
          SizedBox(
            height: 6.h,
          ),
          item('Edit session', () {}),
          const Divider(
            color: ColorsLimitless.greyLight,
            thickness: 0.2,
          ),
          item('Move Session', () {
            Navigator.pop(context);
            showSessionDatePicker(
                context,
                (date) => BlocProvider.of<SessionBloc>(context)
                    .add(SessionEvent.move(sessionId: widget.sessionId, dateTime: date)));
          }),
          const Divider(
            color: ColorsLimitless.greyLight,
            thickness: 0.2,
          ),
          item('Copy session', () {
            Navigator.pop(context);
            showSessionDatePicker(
                context,
                (date) => BlocProvider.of<SessionBloc>(context)
                    .add(SessionEvent.copySession(sessionId: widget.sessionId, dateTime: date)));
          }),
          const Divider(
            color: ColorsLimitless.greyLight,
            thickness: 0.2,
          ),
          item('Delete session', () {
            showDialog(
                useSafeArea: false,
                context: context,
                builder: (context) {
                  return Container(
                    height: 190.r,
                    color: const Color(0xFF142A4B).withOpacity(0.25),
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                        child: DeleteSession(
                          onTap: () {
                            BlocProvider.of<SessionBloc>(context)
                                .add(SessionEvent.deleteSession(sessionId: widget.sessionId));
                          },
                        )),
                  );
                });
          }, color: ColorsLimitless.brandColor),
        ],
      ),
    );
  }

  Widget item(String text, Function onPressed, {Color color = ColorsLimitless.greyDark}) {
    return TextButton(
        onPressed: () => onPressed(),
        child: Text(text, style: TextStyle(color: color, fontFamily: 'SF Pro', fontSize: 16)));
  }
}
