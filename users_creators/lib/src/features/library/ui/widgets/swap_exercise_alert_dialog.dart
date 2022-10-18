import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwapExerciseAlertDialog extends StatelessWidget {
  final int index;
  final String name;
  final String image;
  final String exerciseId;
  final String groupId;
  const SwapExerciseAlertDialog(
      {Key? key,
      required this.index,
      required this.name,
      required this.image,
      required this.exerciseId,
      required this.groupId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: const Color(0xFF142A4B).withOpacity(0.35),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: CupertinoAlertDialog(
            title: const Text('Swap Exercise?'),
            content: Column(
              children: [
                SizedBox(
                  height: 2.r,
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    letterSpacing: 0.5,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(
                  height: 10.r,
                ),
                Text(
                  'If you swap an exercise with values logged, you may lose your data for that exercise.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    letterSpacing: 0.5,
                    fontSize: 12.sp,
                  ),
                )
              ],
            ),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                textStyle:
                    TextStyle(fontFamily: "SF Pro", fontSize: 14.sp, fontWeight: FontWeight.w400),
                onPressed: () {
                  context.router.navigateBack();
                },
                child: const Text('No thanks'),
              ),
              CupertinoDialogAction(
                textStyle: TextStyle(
                  fontFamily: "SF Pro",
                  fontSize: 14.sp,
                  color: CupertinoDynamicColor.resolve(CupertinoColors.systemBlue, context),
                ),
                isDestructiveAction: true,
                onPressed: () {
                  //ToDo context.read<AddExerciseBloc>().add(AddedExerciseEvent());
                  context.router.navigateBack();
                },
                child: const Text('Yes!'),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
