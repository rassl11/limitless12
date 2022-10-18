import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Monetize extends StatelessWidget {
  Monetize({Key? key, required this.onPressed})
      : super(key: key);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  
                  
                  Text(
                    'Monetize',
                    style: TextStyle(
                                fontFamily: "SF Pro",
                                fontSize: 26.sp,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w800,
                                color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 8.r,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 0.7.sw,
                    child: Text(
                      '''Create a fitness journey accessable only for paying subscribers''',
                       style: TextStyle(
                          fontFamily: 'SF Pro',
                          height: 1.7,
                          color: Color(0xFF777E90),
                          fontSize: 14.sp,
                          letterSpacing: 0.5),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SvgPicture.asset(
                               'assets/icons/settings/arrow_right.svg',
                              height: 19.r,
                            )
        ],
      ),
    );
  }
}
