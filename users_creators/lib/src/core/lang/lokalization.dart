import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'gen/codegen_loader.g.dart';

class Localization extends StatelessWidget {
  const Localization({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
         Locale('en'),
      ],
      path: 'lang',
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      assetLoader:  const CodegenLoader(),
      child: child,
    );
  }
}