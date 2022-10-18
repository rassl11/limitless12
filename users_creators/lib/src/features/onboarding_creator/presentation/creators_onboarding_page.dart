import 'package:auto_route/auto_route.dart';
import 'package:components/buttons/app_buttons.dart';
import 'package:components/common_widgets/carousel/carousel.dart';
import 'package:components/common_widgets/header/top_panel.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/core/config/router.dart';
import 'package:users_creators/src/features/onboarding_creator/bloc/creator_onboarding_bloc.dart';

import 'widgets/show_payment_dialog.dart';

class CreatorsOnboardingPage extends StatefulWidget {
  final List<Widget> onboardingOptions;
  final Function onOnboardingComplete;

  const CreatorsOnboardingPage(
      {Key? key,
      required this.onboardingOptions,
      required this.onOnboardingComplete})
      : super(key: key);

  @override
  State<CreatorsOnboardingPage> createState() => _CreatorsOnboardingPageState();
}

class _CreatorsOnboardingPageState extends State<CreatorsOnboardingPage> {
  PageController pageController = PageController();
  final ValueNotifier<int> pageIndexNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    pageController.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CreatorOnboardingBloc>(
            create: (context) => CreatorOnboardingBloc(
                pageController: pageController,
                pagesLength: widget.onboardingOptions.length),
          )
        ],
        child: BlocBuilder<CreatorOnboardingBloc, CreatorOnboardingState>(
          builder: (context, state) {
            final creatorOnboradingBloc = context.read<CreatorOnboardingBloc>();

            return state.map(idle: (value) {
              return Scaffold(
                  backgroundColor: Colors.white,
                  body: SafeArea(
                    child: Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: PageView.builder(
                            controller: pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            onPageChanged: (index) =>
                                pageIndexNotifier.value = index,
                            itemCount: widget.onboardingOptions.length,
                            itemBuilder: (context, i) {
                              return Center(child: widget.onboardingOptions[i]);
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TopPanel(onTap: () {
                                  if (pageIndexNotifier.value != 0) {
                                    context.read<CreatorOnboardingBloc>().add(
                                        CreatorOnboardingEvent.changePage(
                                            pageNumber:
                                                pageIndexNotifier.value - 1,
                                            creator: state.creator,
                                            canGoNext: true));
                                  } else {
                                    context.navigateBack();
                                  }
                                }),
                                SizedBox(
                                  height: 20.r,
                                ),
                                AppPageViewIndicator(
                                    pageIndexNotifier: pageIndexNotifier,
                                    length: widget.onboardingOptions.length,
                                    activeColor: ColorsLimitless.greyDark,
                                    color: ColorsLimitless.greyLight),
                              ],
                            )),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (pageIndexNotifier.value != 2)
                                  AppButtons().redButton(
                                      context,
                                      pageIndexNotifier.value ==
                                              widget.onboardingOptions.length -
                                                  1
                                          ? 'Complete'
                                          : 'Next', () async {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    setState(() {
                                      if (value.canGoNext) {
                                        if (pageIndexNotifier.value == 4) {
                                          creatorOnboradingBloc.add(
                                              CreatorOnboardingEvent
                                                  .becameCreator(
                                                      creator: state.creator));

                                          creatorOnboradingBloc.add(
                                              CreatorOnboardingEvent.changePage(
                                                  pageNumber: 5,
                                                  creator: state.creator,
                                                  canGoNext: false));
                                        }
                                        if (pageIndexNotifier.value == 3) {
                                          creatorOnboradingBloc.add(
                                              CreatorOnboardingEvent.setTags(
                                                  tags: state.userTags));
                                        }
                                        if (pageIndexNotifier.value !=
                                            widget.onboardingOptions.length -
                                                1) {
                                          creatorOnboradingBloc.add(
                                              CreatorOnboardingEvent.changePage(
                                                  pageNumber:
                                                      pageIndexNotifier.value +
                                                          1,
                                                  creator: state.creator,
                                                  canGoNext: false));
                                        } else {
                                          context.router.navigate(
                                            const WelcomeCreatorPageRoute(),
                                          );
                                        }
                                      }
                                    });
                                  },
                                      color: value.canGoNext
                                          ? ColorsLimitless.brandColor
                                          : ColorsLimitless.greyLight),
                                if (pageIndexNotifier.value == 0)
                                  AppButtons().onboardingButton('Skip', () {
                                    context.read<CreatorOnboardingBloc>().add(
                                        CreatorOnboardingEvent.changePage(
                                            pageNumber:
                                                pageIndexNotifier.value + 1,
                                            creator: state.creator,
                                            canGoNext: false));
                                  }, ColorsLimitless.greyLight),
                                if (pageIndexNotifier.value == 2) ...[
                                  AppButtons().redButton(
                                    context,
                                    'Join Limitless One',
                                    () {
                                      showPaymentDialog(context);
                                    },
                                    color: ColorsLimitless.brandColor,
                                  ),
                                  SizedBox(height: 8.r),
                                  AppButtons().onboardingButton(
                                    'Not Right Now, Thanks',
                                    () {
                                      context.read<CreatorOnboardingBloc>().add(
                                            CreatorOnboardingEvent.changePage(
                                              pageNumber:
                                                  pageIndexNotifier.value + 1,
                                              creator: state.creator,
                                              canGoNext: true,
                                            ),
                                          );
                                    },
                                    ColorsLimitless.greyLight,
                                  ),
                                  SizedBox(height: 8.r),
                                  AppButtons().onboardingButton(
                                    'Learn more about creating paywall fitness content!',
                                    () {},
                                    ColorsLimitless.brandColor,
                                  ),
                                ],
                              ],
                            )),
                      )
                    ]),
                  ));
            });
          },
        ));
  }
}
