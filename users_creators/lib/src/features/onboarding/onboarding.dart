import 'package:auto_route/auto_route.dart';
import 'package:components/common_widgets/progress.dart';
import 'package:flutter/material.dart';
import 'package:users_creators/src/core/constants/routes.dart';
import 'package:users_creators/src/features/onboarding/presentation/onboarding_page.dart';
import 'package:users_creators/src/features/onboarding/repo/onboarding_repo.dart';

import '../login/repo/login_repo.dart';
import 'domain/onboarding_model.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late Image image1;
  late Image image2;
  late Image image3;
  @override
  void initState() {
    super.initState();
    image1 = Image.asset('assets/images/onboarding/onboarding_1.png');
    image2 = Image.asset('assets/images/onboarding/onboarding_2.png');
    image3 = Image.asset('assets/images/onboarding/onboarding_3.png');
    setState(() {
      isLoading = true;
    });
    isOnboardingBeenShown().then((value) {
      if (value) {
        isLoggedIn().then((value) {
          setState(() {
            isLoading = false;
          });
          if (value) {
            context.router.navigateNamed('/bottom-bar-page');
          } else {
            context.router.navigateNamed(Routes.userLoginRoot);
          }
        });
      }
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(image1.image, context);
    precacheImage(image2.image, context);
    precacheImage(image3.image, context);
    super.didChangeDependencies();
  }

  static Future<bool> isOnboardingBeenShown() async {
    final onboarding = await OnboardingRepo().isOnboardingBeenShown();
    return onboarding;
  }

  static Future<bool> isLoggedIn() async {
    bool result = false;
    final loginRepo = LoginRepo();
    var value = loginRepo.getAuthData();
    result = value?.refreshToken != null;
    return result;
  }

  late bool isLoading;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active ||
              snapshot.connectionState == ConnectionState.waiting ||
              snapshot.connectionState == ConnectionState.none) {
            return const AppLoadingWidget();
          } else {
            return OnboardingPage(
                onboardingOptions: [
                  OnboardingOptions(imageAssetPath: image1, title: 'Track you routine', message: 'You can track it all with our intuitive interface'),
                  OnboardingOptions(
                      imageAssetPath: image2,
                      title: 'Start doing sports',
                      message: 'Exercise can improve your stability and also what is called your "kinesthetic awarness"'),
                  OnboardingOptions(
                      imageAssetPath: image3,
                      title: 'Workout routine planner ',
                      message: 'Create your own workout plans personalized to your goals to help you get in shape.'),
                ],
                onOnboardingComplete: () {
                  context.router.navigateNamed(Routes.userLoginRoot);
                });
          }
        });
  }
}
