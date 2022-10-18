import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RemoveAdsOption extends StatelessWidget {
  final String title;
  final String price;
  final bool selected;
  final Function onTap;
  const RemoveAdsOption(
      {Key? key,
      required this.title,
      required this.price,
      required this.selected,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: 140,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            border: Border.all(color: ColorsLimitless.grayNeutrals),
            borderRadius: BorderRadius.circular(6)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title.toUpperCase(),
                    style: TextStyle(
                        color: ColorsLimitless.greyMedium,
                        fontFamily: 'SF Pro',
                        fontSize: 12.sp,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    price,
                    style: TextStyle(
                        color: ColorsLimitless.greyDark,
                        fontFamily: 'SF Pro',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800),
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: ColorsLimitless.brandColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(4)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '1 week Free Trial',
                            style: TextStyle(
                                color: ColorsLimitless.brandColor,
                                fontFamily: 'SF Pro',
                                fontSize: 12.sp,
                                letterSpacing: 0.7,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'Cancel anytime',
                        style: TextStyle(
                            color: ColorsLimitless.greyMedium,
                            fontFamily: 'SF Pro',
                            fontSize: 12.sp,
                            letterSpacing: 0.7,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ],
              ),
              !selected
                  ? SvgPicture.asset(
                      'assets/icons/onboarding_creator/grey.svg',
                      height: 20.r,
                    )
                  : SvgPicture.asset(
                      'assets/icons/onboarding_creator/ful_red.svg',
                      height: 20.r,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
