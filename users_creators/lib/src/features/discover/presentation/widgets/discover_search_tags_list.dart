import 'package:auto_route/auto_route.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/discover/bloc/discover_bloc.dart';
import 'package:users_creators/src/features/discover/bloc/search_result/search_result_bloc.dart';
import 'package:users_creators/src/features/discover/bloc/search_result/search_result_event.dart';
import 'package:users_creators/src/features/discover/domain/category.dart';

import '../../../../core/config/router.dart';
import '../../bloc/search_result/search_result_state.dart';

class DiscoverSearchTagsList extends StatefulWidget {
  final bool showCategory;
  const DiscoverSearchTagsList({Key? key, required this.showCategory})
      : super(key: key);

  @override
  State<DiscoverSearchTagsList> createState() => _DiscoverSearchTagsListState();
}

class _DiscoverSearchTagsListState extends State<DiscoverSearchTagsList> {
  int? category;
  int? tag;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverBloc, DiscoverState>(builder: (context, state) {
      return state.map(initial: (value) {
        return ListView.builder(
          padding: EdgeInsets.only(left: 13.r),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            itemBuilder: (context, i) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widget.showCategory != false
                        ? i == 0
                            ? Text(
                                '#Popular search',
                                style: TextStyle(
                                    fontFamily: "SF Pro",
                                    fontSize: 13.sp,
                                    color: ColorsLimitless.textColor,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 0.5),
                              )
                            : Text(
                                '#All tags',
                                style: TextStyle(
                                    fontFamily: "SF Pro",
                                    fontSize: 13.sp,
                                    color: ColorsLimitless.textColor,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 0.5),
                              )
                        : const SizedBox(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.r),
                      child: Wrap(
                        spacing: 10.r,
                        runSpacing: 4.r,
                        children: List<Widget>.generate(
                          categories[i].tags.length,
                          (int index) {
                            return ChoiceChip(
                              side: const BorderSide(
                                  color: ColorsLimitless.textColor),
                              label: Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.r),
                                child: Text('#${value.tag[index].tagName}'),
                              ),
                              labelStyle: TextStyle(
                                  color: index == tag && i == category
                                      ? Colors.white
                                      : ColorsLimitless.textColor,
                                  fontFamily: 'SF Pro',
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400),
                              backgroundColor: index == tag && i == category
                                  ? ColorsLimitless.textColor
                                  : Colors.white,
                              selectedColor: ColorsLimitless.textColor,
                              selected: index == tag && i == category,
                              onSelected: (bool selected) {
                              context.read<SearchResultBloc>().add(FindResultHashTagEvent());
                                setState(() {
                                // SearchResultState.changeName(value.tag[index].tagName!);
                              
                                  tag = selected ? index : null;
                                  category = selected ? i : null;
                                  context.router.push(DiscoverResultPageRoute(
                                    showHashTag: true,
                                      tag: value.tag[index].tagName!));
                                });
                              },
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ]);
            });
      }, loading: (value) {
        return const Offstage();
      });
    });
  }
}
