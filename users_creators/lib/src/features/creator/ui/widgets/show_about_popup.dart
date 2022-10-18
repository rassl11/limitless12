import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:users_creators/src/features/creator/ui/widgets/trainer_info_list.dart';

class ShowAboutPopup {


  static Future openAboutBottomSheet(
      {required BuildContext context,
      required String? image,
      required String name,
      required String lastName,
      required String experience,
      required String description,
      required String certification,
      required String requirements,
      required String? instagram,
      required String? youtube,
      required String? tikTok,
      required List? tags,
      required String specification}) async {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r))),
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Stack(
            children: [
              Container(
                height: 0.93.sh,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.r),
                      topRight: Radius.circular(15.r)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 18.r, right: 18.r, top: 36.r, bottom: 20.r),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8.r,
                        ),
                        Row(
                          children: [
                            Image.network(
                              image!,
                              height: 140.h,
                              width: 80.r,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: ColorsLimitless.greyDark,
                                  height: 140.h,
                                  width: 80.r,
                                  child: const Center(
                                    child: Text(
                                      'No photo',
                                      style: TextStyle(
                                          fontFamily: "SF Pro",
                                          color: Colors.white),
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              width: 15.r,
                            ),
                            SizedBox(
                              height: 130.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '${name} ${lastName}',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.r,
                                  ),
                                  Text(
                                    description,
                                    style: TextStyle(
                                        fontFamily: 'SF Pro',
                                        color: const Color(0xFF777E90),
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.6,
                                        fontSize: 17.sp),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15.r,
                        ),
                        tags == null
                            ? SizedBox()
                            : Wrap(
                                spacing: 8.0,
                                runSpacing: 8.0,
                                children: List.generate(
                                    tags.length,
                                    (index) => Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30.r),
                                            border: Border.all(
                                                color: const Color(0xFFE94359)),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.r, vertical: 4.r),
                                            child: Text(
                                              tags[index].tagName,
                                              style: TextStyle(
                                                  fontFamily: 'SF Pro',
                                                  color: Color(0xFFE94359),
                                                  fontSize: 10.sp,
                                                  letterSpacing: 0.5,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        )),
                              ),
                        Divider(
                          height: 40.r,
                        ),
                        TrainerInfoList(
                          instagram: instagram,
                          youtube: youtube,
                          tikTok: tikTok,
                          specification: specification,
                          requirements: requirements,
                          experience: experience,
                          description: description,
                          certification: certification,
                        ),
                        SizedBox(
                          height: 30.r,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 18.r,
                right: 110.r,
                child: Container(
                  width: 140.r,
                  height: 5.r,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      color: const Color(0xFFAFB3C1)),
                ),
              ),
            ],
          );
        });
  }
}
