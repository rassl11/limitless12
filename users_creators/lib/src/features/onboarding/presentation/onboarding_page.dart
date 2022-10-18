import 'dart:async';
import 'dart:developer';

import 'package:components/buttons/app_buttons.dart';
import 'package:components/common_widgets/carousel/carousel.dart';
import 'package:flutter/material.dart';
import 'package:users_creators/src/features/onboarding/presentation/onboarding_card.dart';

import '../domain/onboarding_model.dart';
import '../repo/onboarding_repo.dart';

class OnboardingPage extends StatefulWidget {
  final List<OnboardingOptions> onboardingOptions;
  final Function onOnboardingComplete;

  const OnboardingPage(
      {Key? key,
        required this.onboardingOptions,
        required this.onOnboardingComplete})
      : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController pageController = PageController();
  final ValueNotifier<int> pageIndexNotifier = ValueNotifier<int>(0);
  bool showBack = false;
  final onboardingRepo = OnboardingRepo();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        pageController.page != 0 ? showBack = true : showBack = false;
      }
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: [
              PageView.builder(
                controller: pageController,
                  physics: const ClampingScrollPhysics(),
                  onPageChanged: (index) => pageIndexNotifier.value = index,
                  itemCount: widget.onboardingOptions.length,
                  itemBuilder: (context, i) {
                    return OnboardingCard(
                        onboardingOptions: widget.onboardingOptions[i]);
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 30, right: 8),
                child:  Align(
                  alignment: Alignment.topRight,
                  child: AppButtons().onboardingButton('Skip', () async {
                    widget.onOnboardingComplete();
                    await onboardingRepo.setOnboardingBeenShown();
                    }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: AppPageViewIndicator(
                        pageIndexNotifier: pageIndexNotifier,
                        length: widget.onboardingOptions.length)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 8),
                child:  Align(
                  alignment: Alignment.bottomRight,
                  child: AppButtons().onboardingButton('Next', () async {
                      if (pageIndexNotifier.value !=
                          widget.onboardingOptions.length - 1) {
                        unawaited(
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            )
                        );
                      } else {
                        
                        await onboardingRepo.setOnboardingBeenShown();
                        bool isOnboardingBeenShown = await onboardingRepo.isOnboardingBeenShown();
                        log(isOnboardingBeenShown.toString());
                        widget.onOnboardingComplete();
                      }
                  }),
                ),
              ),
              showBack ?
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 8),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: AppButtons().onboardingButton('Back',  () {
                      unawaited(
                          pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          )
                      );
                    }, Colors.white.withOpacity(0.4),)
                  ),
                ) : const Offstage()
            ]));
  }
}



