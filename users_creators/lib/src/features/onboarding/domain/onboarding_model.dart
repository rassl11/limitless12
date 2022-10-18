import 'package:flutter/material.dart';

class OnboardingOptions {
  const OnboardingOptions({
    required this.imageAssetPath,
    required this.title,
    required this.message,
  });

  final Image imageAssetPath;
  final String message;
  final String title;
}