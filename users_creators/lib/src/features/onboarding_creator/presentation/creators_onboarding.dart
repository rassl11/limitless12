import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:users_creators/src/core/constants/routes.dart';

import 'creators_onboarding_page.dart';
import 'pages/about_page.dart';
import 'pages/join_limitless_page.dart';
import 'pages/profile_photo.dart';
import 'pages/tags_page.dart';
import 'pages/tik_tok_page.dart';

class CreatorsOnboarding extends StatefulWidget {
  const CreatorsOnboarding({Key? key}) : super(key: key);

  @override
  State<CreatorsOnboarding> createState() => _CreatorsOnboardingState();
}

class _CreatorsOnboardingState extends State<CreatorsOnboarding> {
  List<Widget> onboardingOptions = [
    // const FullNamePage(),
    const TikTokPage(),
    const AboutPage(),
    // const ContentPage(),
    const JoinLimitlessPage(),
    const TagsPage(),
    // const CoverPhotoPage(),
    const ProfilePhotoPage()
  ];

  @override
  Widget build(BuildContext context) {
    return CreatorsOnboardingPage(
        onboardingOptions: onboardingOptions,
        onOnboardingComplete: () {
          context.router.navigateNamed(Routes.userLoginRoot);
        });
  }
}
