import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'start_session.dart';
import 'subscribe.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int displayedCard = 0;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
          height: 145.r,
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.extentBefore > (MediaQuery.of(context).size.width / 2)) {
                if (displayedCard == 0) {
                  displayedCard = 1;
                  setState(() {});
                }
              } else {
                if (displayedCard == 1) {
                  displayedCard = 0;
                  setState(() {});
                }
              }
              return true;
            },
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.only(left: 14.r,right: 14.r),
                  child: Row(
                    children: [
                      const StartSession(),
                      SizedBox(
                        width: 10.w,
                      ),
                      const Subscribe(),
                    ],
                  ),
                )),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 2.5.h,
              width: 32.w,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: displayedCard == 0
                      ? const Color(0xFFE94359)
                      : const Color(0xFF777E91).withOpacity(0.41),
                  borderRadius: BorderRadius.circular(10.r)),
            ),
            SizedBox(
              width: 5.w,
            ),
            Container(
              height: 2.5.h,
              width: 32.w,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: displayedCard == 1
                      ? const Color(0xFFE94359)
                      : const Color(0xFF777E91).withOpacity(0.41),
                  borderRadius: BorderRadius.circular(10.r)),
            )
          ],
        )
      ],
    );
  }
}
