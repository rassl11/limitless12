import 'package:components/common_widgets/progress.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/discover/bloc/discover_bloc.dart';
import 'package:users_creators/src/features/discover/presentation/widgets/coach_card.dart';
import 'package:users_creators/src/features/discover/presentation/widgets/discover_page_header.dart';
import 'package:users_creators/src/features/discover/presentation/widgets/discover_search_tags_list.dart';
import 'package:users_creators/src/features/discover/presentation/widgets/new_creators.dart';
import 'package:users_creators/src/features/discover/presentation/widgets/popular_creators_widget.dart';
import 'package:users_creators/src/features/discover/presentation/widgets/popular_tag_widget.dart';

import '../domain/coach.dart';

class DiscoverContent extends StatefulWidget {
  final bool showHeader;
  final bool showBackButton;
  const DiscoverContent({
    Key? key,
    required this.showBackButton,
    required this.showHeader,
  }) : super(key: key);

  @override
  State<DiscoverContent> createState() => _DiscoverContentState();
}

class _DiscoverContentState extends State<DiscoverContent> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverBloc, DiscoverState>(builder: (context, state) {
      return state.map(
          initial: (value) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.showHeader)
                  DiscoverPageHeader(showBackButton: widget.showBackButton),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 16.r,
                          ),
                          const PopularTagWidget(
                            index: 0,
                            size: CardSize.large,
                          ),
                          SizedBox(
                            height: 46.r,
                          ),
                          const PopularTagWidget(
                            index: 1,
                            size: CardSize.large,
                          ),
                          const PopularCreatorsWidget(),
                          Padding(
                            padding: EdgeInsets.only(left: 13.r),
                            child: Text(
                              'Latest “fitness journeys”'.toUpperCase(),
                              style: TextStyle(
                                  color: ColorsLimitless.greyMedium,
                                  fontFamily: 'SF Pro',
                                  fontSize: 12.sp,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            height: 150.r,
                            child: ListView.builder(
                                padding: EdgeInsets.only(left: 13.r),
                                scrollDirection: Axis.horizontal,
                                itemCount: coaches.length,
                                itemBuilder: (context, i) {
                                  return const CoachCard(
                                    title: '',
                                    id: '',
                                    size: CardSize.small,
                                    image: '',
                                    name: '',
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          const PopularTagWidget(
                            index: 2,
                            size: CardSize.large,
                          ),
                          SizedBox(
                            height: 46.r,
                          ),
                          const PopularTagWidget(
                            index: 3,
                            size: CardSize.small,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          const NewCreatorsWidget(),
                          SizedBox(height: 30.r),
                          Padding(
                            padding: EdgeInsets.only(left: 13.r),
                            child: Text(
                              'Explore by tag'.toUpperCase(),
                              style: TextStyle(
                                  color: ColorsLimitless.greyMedium,
                                  fontFamily: 'SF Pro',
                                  fontSize: 12.sp,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          const DiscoverSearchTagsList(
                            showCategory: false,
                          ),
                          SizedBox(
                            height: 20.r,
                          )
                        ]),
                  ),
                ),
              ],
            );
          },
          loading: (value) => const AppLoadingWidget());
    });
  }
}
