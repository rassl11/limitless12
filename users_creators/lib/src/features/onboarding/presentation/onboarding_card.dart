import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../domain/onboarding_model.dart';

class OnboardingCard extends StatelessWidget {
  final OnboardingOptions onboardingOptions;

  const OnboardingCard({Key? key, required this.onboardingOptions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: onboardingOptions.imageAssetPath.image,
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      stops: const [
                        0.3,
                        0.9,
                      ],
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.30),
                        Colors.black.withOpacity(0.97),
                      ])),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 100, ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  onboardingOptions.title.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "SF Pro",
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w800,
                      fontSize: 30.r),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Text(
                    onboardingOptions.message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.6,
                        color: Colors.white,
                        fontFamily: "SF Pro",
                        letterSpacing: 0.8,
                        fontWeight: FontWeight.w300,
                        fontSize: 14.r),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
