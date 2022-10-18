import 'package:auto_route/auto_route.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedbackDialog extends StatelessWidget {
  const FeedbackDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 70.r),
      child: AlertDialog(
        insetPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        contentPadding: const EdgeInsets.only(top: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        content: SizedBox(
          height: 300.r,
          width: MediaQuery.of(context).size.width*0.9,
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Help us out and leave some feedback!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'SF Pro',
                    fontSize: 14.5.sp,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 3.r,),
              Text(
                'Limmitless Team',
                style: TextStyle(
                    color: ColorsLimitless.greyMedium,
                    fontFamily: 'SF Pro',
                    letterSpacing: 0.5,
                    fontSize: 14.5.sp,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10.r,
              ),
                const Divider(
                color: ColorsLimitless.greyLight,
              ),
            
               Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.r,),
                child: SizedBox(
                  height: 100.r,
                  child: const TextField(
                    showCursor: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabled: true,
                    ),
                    minLines: 1,
                    maxLines: 10,
                    cursorColor: ColorsLimitless.greyDark,
                  ),
                ),
              ),
            const  Expanded(child: SizedBox()),
              const Divider(
                color: ColorsLimitless.greyLight,
              ),
              SizedBox(height: 5.r,),
            ],
          ),
        ),
        
        actions: [
          SizedBox(
            width: 120.w,
          height: 40.h,
          child: Material(
            borderRadius: BorderRadius.circular(6.r),
            child: InkWell(
              borderRadius: BorderRadius.circular(6.r),
              child: Ink(
                padding: EdgeInsets.zero,
                height: 0.07.sh,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(color: ColorsLimitless.greyLight.withOpacity(0.5)),
                    color: Colors.white),
                child: Center(
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Sf",
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp),
                  ),
                ),
              ),
              onTap: (){
                context.router.pop();
              },
            ),
          ),
        ),
          SizedBox(
            height: 40.h,
            width: 120.w,
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
                    'Submit',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Sf",
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp),
                  ),
                ),
              ),
              onTap: (){
                  context.router.pop();
              },
            ),
          )
        ],
      ),
    );
  }
}
