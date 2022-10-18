import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RecommandedWidget extends StatelessWidget {
  RecommandedWidget(
      {Key? key,
      required this.onPressed,
      })
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
                children: [              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Grow',
                        style: TextStyle(
                            fontFamily: "SF Pro",
                            fontSize: 26.sp,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w800,
                            color:  Colors.black),
                      ),
                      SizedBox(
                    width: 16.r,
                  ),
                      Container(
                        decoration: BoxDecoration(
                            color: ColorsLimitless.greyMedium,
                            borderRadius: BorderRadius.circular(6)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'recommended'.toUpperCase(),
                            style: TextStyle(
                                fontFamily: "SF Pro",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                  
                ],
              ),
              SizedBox(
                height: 8.r,
              ),
              Text(
                '''• Increase social media engagement
   & followers''',
                style: TextStyle(
                    fontFamily: 'SF Pro',
                    height: 1.7,
                    color: Color(0xFF777E90),
                    fontSize: 14.sp,
                    letterSpacing: 0.5),
              ),
              SizedBox(
                height: 10.r,
              ),
              Text(
                '''• Create a fitness journey accessable 
    to everyone, followers can become 
    subscribers''',
                style: TextStyle(
                    fontFamily: 'SF Pro',
                    height: 1.7,
                    color: Color(0xFF777E90),
                    fontSize: 14.sp,
                    letterSpacing: 0.5),
              )
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
