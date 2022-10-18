import 'package:auto_route/auto_route.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/library/ui/pages/library_page.dart';

class FloatingAction extends StatelessWidget{
  const FloatingAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SpeedDial(
            icon: Icons.add,
            buttonSize: const Size(48, 48),
            activeIcon: Icons.close,
            backgroundColor: ColorsLimitless.brandColor,
            foregroundColor: Colors.white,
            activeBackgroundColor: Colors.white,
            activeForegroundColor: ColorsLimitless.brandColor,
            visible: true,
            closeManually: false,
            curve: Curves.bounceIn,
            overlayColor: Colors.black,
            overlayOpacity: 0.5,
            elevation: 20.0,
            shape: const CircleBorder(),
            children: [
              SpeedDialChild(
                onTap: (() {
                  showModalBottomSheet( 
                      isScrollControlled: true,
                      isDismissible: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      context: context,
                      builder: (_) {
                        return const LibraryPage(isFull: false,);
                      },
                    );
                }),
                backgroundColor: Colors.white,
                labelWidget: Container(
                  height: 35.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6)),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 18.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                            'assets/icons/create_session/library.svg',
                            height: 18.r),
                        const SizedBox(
                          width: 10,
                        ),
                        Text('Add From Library', style: TextStyle(
                          letterSpacing: 0.8,
                      fontFamily: "SF Pro",
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ))
                      ],
                    ),
                  ),
                ),
              ),
              SpeedDialChild(
                onTap: (){
                  context.router.pushNamed('/main-flow');
                },
                backgroundColor: Colors.white,
                labelWidget: Container(
                  height: 35.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6)),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 18.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                            'assets/icons/create_session/add_circle.svg',
                            height: 18.r),
                        const SizedBox(
                          width: 10,
                        ),
                        Text('Create Session', style: TextStyle(
                          letterSpacing: 0.8,
                      fontFamily: "SF Pro",
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
    );
  }

}