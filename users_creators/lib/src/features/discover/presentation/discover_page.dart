import 'package:flutter/material.dart';

import 'discover_content.dart';

class DiscoverPage extends StatefulWidget {
  final bool showBackButton;
  const DiscoverPage({Key? key, this.showBackButton = true}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DiscoverContent(
          showBackButton: widget.showBackButton,
          showHeader: true,
        ),
      ),
    );
  }
}
