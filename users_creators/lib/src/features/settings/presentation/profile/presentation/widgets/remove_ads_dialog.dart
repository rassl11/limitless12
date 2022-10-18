import 'package:auto_route/auto_route.dart';
import 'package:components/buttons/app_buttons.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users_creators/src/features/settings/presentation/profile/presentation/widgets/remove_ads_option.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
class RemoveAdsDialog extends StatefulWidget {
  final Function(int) buy;
  final Function restore;
  const RemoveAdsDialog({Key? key, required this.buy, required this.restore}) : super(key: key);

  @override
  State<RemoveAdsDialog> createState() => _RemoveAdsDialogState();
}

class _RemoveAdsDialogState extends State<RemoveAdsDialog> {
  int? selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 70.r),
      child: AlertDialog(
        insetPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        contentPadding: const EdgeInsets.only(top: 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        content: SizedBox(
          height: 540.h,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Stack(
            children: [
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: svg.Svg(
                        'assets/icons/settings/background_icons.svg',
                      ),
                      fit: BoxFit.cover,
                    ),),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    context.router.pop();
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/settings/close.svg',
                    color: ColorsLimitless.greyLight,
                    height: 24.r,
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 70.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'Want to browse the app Ad-free?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: ColorsLimitless.greyDark,
                          fontFamily: 'SF Pro',
                          fontSize: 28.sp,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  RemoveAdsOption(
                    title: 'monthly',
                    price: '\$0.99',
                    selected: selected == 0,
                    onTap: () {
                      setState(() {
                        selected = 0;
                      });
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  RemoveAdsOption(
                    title: 'annually',
                    price: '\$8.99',
                    selected: selected == 1,
                    onTap: () {
                      setState(() {
                        selected = 1;
                      });
                    },
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
                   child:  AppButtons().redButton(context, 'Subscribing', (){
                    if(selected != null){
                    widget.buy(selected!);
                    }
                   }, isLarge: true),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  TextButton(onPressed: (){
                    widget.restore();
                  }, child: Text('Restore purchase', style: TextStyle(
                          color: ColorsLimitless.greyDark,
                          fontFamily: 'SF Pro',
                          fontSize: 16.sp,
                          letterSpacing: 0.7,
                          fontWeight: FontWeight.w500),))
                 
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
