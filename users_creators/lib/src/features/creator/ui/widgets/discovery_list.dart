import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/creator/entity/discover_model.dart';


class DiscoveryList extends StatelessWidget {
   DiscoveryList({ Key? key,required this.index }) : super(key: key);
  
  int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:  EdgeInsets.symmetric(vertical: 13.r),
        child: Row(
          children: [
            Image.asset(
              discoverList[index].image,
              height: 40.r,
            ),
            SizedBox(
              width: 8.r,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  discoverList[index].name,
                  style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5),
                ),
                SizedBox(
                  height: 10.r,
                ),
                Text(
                  discoverList[index].nickName,
                  style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontSize: 11.sp,
                      color: Color(0xFF777E90),
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5),
                ),
              ],
            ),
          const  Expanded(child: SizedBox()),
            SvgPicture.asset(
              discoverList[index].icon,
              height: 19.r,
            ),
            SizedBox(
              width: 30.r,
            ),
            Text(discoverList[index].follow,
                  style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontSize: 11.5.sp,
                      color: const Color(0xFF353945),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5),)
          ],
        ),
      );
  }
}