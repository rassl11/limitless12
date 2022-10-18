import 'package:auto_route/auto_route.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/onboarding_creator/domain/monetize.dart';

class MonetizeDialog extends StatefulWidget {
  MonetizeDialog({Key? key, required this.selected, required this.onTap}) : super(key: key);
  final Function(int) onTap;
  int selected;
  
  

  @override
  State<MonetizeDialog> createState() => _MonetizeDialogState();
}

class _MonetizeDialogState extends State<MonetizeDialog> {
  List<Monetize> monetize = [
    Monetize(price: '\$1', title: 'Starter', subtitle: 'Under 10k followers'),
    Monetize(price: '\$2.99', title: 'Advance', subtitle: '10k-100k followers'),
    Monetize(price: '\$4.99', title: 'Pro', subtitle: '100k+ followers'),
  ];

  

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.only(top: 20.r),
          child: AlertDialog(
            insetPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            contentPadding: const EdgeInsets.only(top: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.85,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        InkWell(
                          onTap: (){
                            context.router.pop();
                          },
                          child: SvgPicture.asset(
                                              'assets/icons/settings/close.svg',
                                              color: ColorsLimitless.greyLight,
                                              height: 24.r,
                                            ),
                        ),
                      ],
                    ),
                    
                    Text(
                          'Monetize',
                          style: TextStyle(
                              fontFamily: "SF Pro",
                              fontSize: 26.sp,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        ),
                    growText('Create a fitness journey accessible only for paying subscribers'),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      'Subscription fee',
                      style: TextStyle(
                          fontFamily: "SF Pro",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: monetize.length,
                        itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              widget.onTap(index);
                              widget.selected = index;
                            });
                          },
                          child: select(context, widget.selected == index, monetize[index]));
                      }),
                    )
                  ],
                ),
              ),
            ),
            actions: [
              SizedBox(
                height: 40.h,
                width: MediaQuery.of(context).size.width * 0.75,
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
                        'Choose Monetize',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Sf",
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp),
                      ),
                    ),
                  ),
                  onTap: () => context.router.pop(),
                ),
              )
            ],
          ),
        );
  }

  Widget growText(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/icons/onboarding_creator/tick-square.svg',
            height: 14.r,
            color: ColorsLimitless.greyDark,
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.start,
              textHeightBehavior:
                  const TextHeightBehavior(applyHeightToFirstAscent: false),
              style: TextStyle(
                  height: 1.6,
                  color: ColorsLimitless.greyDark,
                  fontFamily: "Sf",
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp),
            ),
          )
        ],
      ),
    );
  }

  Widget select(BuildContext context, bool pressed, Monetize monetize) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
            color: ColorsLimitless.greyLight.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              !pressed
                      ? SvgPicture.asset(
                          'assets/icons/onboarding_creator/grey.svg',
                          height: 19.r,
                        )
                      : SvgPicture.asset(
                          'assets/icons/onboarding_creator/ful_red.svg',
                          height: 19.r,
                        ),
              SizedBox(
                width: 20.r,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    monetize.title!,
                    style: TextStyle(
                        color: ColorsLimitless.greyDark,
                        fontFamily: "Sf",
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp),
                  ),
                  Text(
                    monetize.subtitle!,
                    style: TextStyle(
                        color: ColorsLimitless.greyLight,
                        fontFamily: "Sf",
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp),
                  ),
                ],
              ),
              const  Expanded(child: SizedBox(),),
              Text(
                    monetize.price!,
                    style: TextStyle(
                        color: ColorsLimitless.greyDark,
                        fontFamily: "Sf",
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
