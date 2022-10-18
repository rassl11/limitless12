import 'package:auto_route/auto_route.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.cancelButton,
      required this.confirmButton,
      required this.onConfirm})
      : super(key: key);

  final String title;
  final String subTitle;
  final String confirmButton;
  final String cancelButton;
  final Function onConfirm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50.r),
      child: AlertDialog(
        insetPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        contentPadding: const EdgeInsets.only(top: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        content: SizedBox(
          height: 80.h,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'SF Pro',
                    fontSize: 17.sp,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10.r,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'SF Pro',
                      letterSpacing: 0.5,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: ColorsLimitless.brandColor),
                child: Center(
                  child: Text(
                    confirmButton,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "SF Pro Display",
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp),
                  ),
                ),
              ),
              onTap: () {
                onConfirm();
                Navigator.pop(context);
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
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(
                          color: ColorsLimitless.greyLight.withOpacity(0.5)),
                      color: Colors.white),
                  child: Center(
                    child: Text(
                      cancelButton,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "SF Pro Display",
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp),
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
  }
}
