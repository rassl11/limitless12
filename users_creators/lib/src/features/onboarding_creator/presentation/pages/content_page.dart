import 'dart:developer';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:components/common_widgets/progress.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/onboarding_creator/bloc/creator_onboarding_bloc.dart';
import 'package:users_creators/src/features/onboarding_creator/domain/creator.dart';
import 'package:users_creators/src/features/onboarding_creator/presentation/widgets/grow_dialog.dart';
import 'package:users_creators/src/features/onboarding_creator/presentation/widgets/monetize_dialog.dart';
import '../widgets/monetize_widget.dart';
import '../widgets/recommanded_widget.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);
  

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  

  void next() {
    context.router.navigateNamed('/tags-creator');
  }


  int growSelected = 0;
  int monetizeSelected = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatorOnboardingBloc, CreatorOnboardingState>(
        builder: (context, state) {
      return state.isLoading ? const AppLoadingWidget() :Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.r, vertical: 10.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.r,
                  ),
                  Text(
                    'CHOOSE YOUR FITNESS JOURNEY PLAN',
                    style: TextStyle(
                        color: ColorsLimitless.greyDark,
                        fontSize: 20.sp,
                        letterSpacing: 0.5,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700,
                        fontFamily: "SF Pro"),
                  ),
                  SizedBox(
                    height: 10.r,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Text(
                      'Supercharge your growth and visibility with our range of easy to use subscription plans. Choose the right service depending on your current amount of followers.',
                      style: TextStyle(
                          color: ColorsLimitless.greyLight,
                          fontSize: 14.sp,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w400,
                          fontFamily: "SF Pro"),
                    ),
                  ),
                  SizedBox(
                    height: 30.r,
                  ),
                  
                  RecommandedWidget(
                    onPressed: () {
                      showDialog(
                          useSafeArea: false,
                          context: context,
                          builder: (context) {
                            return Container(
                                height: 200,
                                color:
                                    const Color(0xFF142A4B).withOpacity(0.25),
                                child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 1.5, sigmaY: 1.5),
                                    child: 
                                    
                                    GrowDialog(
                                      selected: growSelected,
                                      onTap: (value) {
                                        setState(() {
                                          growSelected = value;
                                          log(growSelected.toString());
                                        });
                                      },
                                    ))
                                    );
                          }).then((value){
                            BlocProvider.of<CreatorOnboardingBloc>(context).add(
                              CreatorOnboardingEvent.addCreatorInfo(
                                  creator:
                                      state.creator.copyWith(grow: growSelected),
                                  canGoNext: true));
                          });
                    },
                  ),
                  const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: Divider(
                        color: ColorsLimitless.greyLight,
                        thickness: 0.5,
                      )),
                  Monetize(
                    onPressed: () {
                      showDialog(
                          useSafeArea: false,
                          context: context,
                          builder: (context) {
                            return Container(
                                height: 200,
                                color:
                                    const Color(0xFF142A4B).withOpacity(0.25),
                                child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 1.5, sigmaY: 1.5),
                                    child: MonetizeDialog(
                                      onTap: (value) {
                                        setState(() {
                                          monetizeSelected = value;
                                          log(monetizeSelected.toString());
                                        });
                                      },
                                      selected: monetizeSelected,
                                    )));
                          }).then((value){
                            BlocProvider.of<CreatorOnboardingBloc>(context).add(
                              CreatorOnboardingEvent.addCreatorInfo(
                                  creator:
                                      state.creator.copyWith(monetize: monetizeSelected),
                                  canGoNext: true));
                          });;
                    },
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget select(BuildContext context, bool pressed, String text) {
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
              Text(
                text,
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
