import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/discover/presentation/widgets/discover_search_tags_list.dart';
import 'package:users_creators/src/features/discover/presentation/widgets/search_page_header.dart';
import 'package:users_creators/src/features/discover/presentation/widgets/serch_field.dart';

import '../domain/tag.dart';

class DiscoverSearchPage extends StatefulWidget {
  const DiscoverSearchPage({Key? key}) : super(key: key);

  @override
  State<DiscoverSearchPage> createState() => _DiscoverSearchPageState();
}

class _DiscoverSearchPageState extends State<DiscoverSearchPage> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.r),
          child: Column(
            children: [
              const DiscoverSearchPageHeader(),
              const SearchField(),
              SizedBox(
                height: 20.r,
              ),
              const DiscoverSearchTagsList(
                showCategory: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
