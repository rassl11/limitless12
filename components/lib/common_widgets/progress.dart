import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';

class AppLoadingWidget extends StatelessWidget {
  final double? paddingTop;

  const AppLoadingWidget({Key? key, this.paddingTop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isNoCenter = paddingTop != null;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment:
            isNoCenter ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          if (isNoCenter) SizedBox(height: paddingTop),
          Expanded(
            child: Align(
              alignment: isNoCenter ? Alignment.topCenter : Alignment.center,
              child: const CircularProgressIndicator(
                color: ColorsLimitless.brandColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
