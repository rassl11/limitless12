// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users_creators/src/features/login/repo/login_repo.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UserWebViewPage extends StatefulWidget {
  final String appBarTitle;

  const UserWebViewPage({
    Key? key,
    required this.appBarTitle,
  }) : super(key: key);

  @override
  State<UserWebViewPage> createState() => _UserWebViewPageState();
}

class _UserWebViewPageState extends State<UserWebViewPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  final webviewUrl = 'https://prod-app.limitlesspro.io';

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsLimitless.backgroundColor,
      appBar: AppBar(
        title: Text(
          widget.appBarTitle,
          style: TextStyle(
            color: ColorsLimitless.greyDark,
            fontFamily: 'SF Pro',
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: Center(
          child: GestureDetector(
            onTap: () => context.router.navigateBack(),
            child: SvgPicture.asset(
              'assets/icons/top_panel_library/left_arrow.svg',
              height: 18.r,
            ),
          ),
        ),
        actions: const [
          // NavigationControls(_controller.future),
        ],
      ),
      body: WebView(
        initialUrl: webviewUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) async {
          _controller.complete(webViewController);

          final authData = context.read<LoginRepo>().getAuthData();
          final controller = await _controller.future;
          final headers = <String, String>{
            'embedded': 'true',
            'accessToken': authData!.accessToken!,
            'refreshToken': authData.refreshToken!,
          };
          controller.loadUrl(webviewUrl, headers: headers);
        },
        onPageStarted: (url) async {},
        gestureNavigationEnabled: false,
        backgroundColor: ColorsLimitless.backgroundColor,
      ),
    );
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture, {Key? key})
      : super(key: key);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController? controller = snapshot.data;
        return Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: !webViewReady
                  ? null
                  : () async {
                      if (await controller!.canGoBack()) {
                        await controller.goBack();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('No back history item')),
                        );
                        return;
                      }
                    },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: !webViewReady
                  ? null
                  : () async {
                      if (await controller!.canGoForward()) {
                        await controller.goForward();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('No forward history item')),
                        );
                        return;
                      }
                    },
            ),
            IconButton(
              icon: const Icon(Icons.replay),
              onPressed: !webViewReady
                  ? null
                  : () {
                      controller!.reload();
                    },
            ),
          ],
        );
      },
    );
  }
}
