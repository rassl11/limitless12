import 'package:auto_route/auto_route.dart';
import 'package:components/common_widgets/progress.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/creator/bloc/creator/creator_bloc.dart';
import 'package:users_creators/src/features/creator/bloc/creator/creator_event.dart';
import 'package:users_creators/src/features/creator/bloc/subscribe/user_subscribe_bloc.dart';
import 'package:users_creators/src/features/creator/bloc/subscribe/user_subscribe_event.dart';
import 'package:users_creators/src/features/discover/bloc/search_result/search_result_bloc.dart';
import 'package:users_creators/src/features/discover/bloc/search_result/search_result_state.dart';
import 'package:users_creators/src/features/discover/presentation/widgets/coach_card.dart';
import 'package:users_creators/src/features/discover/presentation/widgets/discover_result_header.dart';

class DiscoverResultPage extends StatelessWidget {
  final String tag;
  final bool showHashTag;

  const DiscoverResultPage({super.key, required this.tag, required this.showHashTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SearchResultBloc, SearchResultState>(
          builder: (context, state) {
            if (state is LoadingResultState) {
              return const AppLoadingWidget();
            }
            if (state is FoundResultHashTagState) {
              return Padding(
                padding: EdgeInsets.only(top: 5.h, left: 20.r, right: 20.r),
                child: Column(
                  children: [
                    DiscoverResultHeader(
                      tag: tag,
                      showHashTag: showHashTag,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 25.r,
                            ),
                            GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1, crossAxisCount: 2, mainAxisExtent: 150.r, mainAxisSpacing: 18.r, crossAxisSpacing: 20.r),
                              itemBuilder: ((context, index) {
                                return CoachCard(
                                  title: state.list![index].title,
                                  id: state.list![index].id,
                                  size: CardSize.small,
                                  image: state.list![index].image,
                                  name: state.list![index].name,
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is ErrorResultState) {
              return Padding(
                padding: EdgeInsets.only(left: 13.r, right: 13.r),
                child: Column(children: [
                  DiscoverResultHeader(
                    tag: tag,
                    showHashTag: showHashTag,
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    'No tag has been found',
                    style: TextStyle(fontFamily: "SF Pro", fontSize: 13.sp, color: ColorsLimitless.textColor),
                  ),
                  Expanded(child: SizedBox())
                ]),
              );
            }

            if (state is FoundResultNameState) {
              return Padding(
                padding: EdgeInsets.only(top: 5.h, left: 20.r, right: 20.r),
                child: Column(
                  children: [
                    DiscoverResultHeader(
                      tag: tag,
                      showHashTag: showHashTag,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 25.r,
                            ),
                            GridView.builder(
                              itemCount: state.list!.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 1,
                                crossAxisCount: 2,
                                mainAxisExtent: 150.r,
                                mainAxisSpacing: 18.r,
                                crossAxisSpacing: 20.r,
                              ),
                              itemBuilder: ((context, index) {
                                return GestureDetector(
                                  child: Stack(
                                    alignment: Alignment.bottomLeft,
                                    children: [
                                      state.list![index].avatarUrl == null || state.list![index].avatarUrl.isEmpty
                                          ? Container(
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r), color: ColorsLimitless.greyDark),
                                              child: Center(
                                                child: Text(
                                                  'No photo',
                                                  style: TextStyle(fontFamily: 'SF Pro', fontSize: 12.sp, letterSpacing: 0.5, color: Colors.white),
                                                ),
                                              ),
                                            )
                                          : Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(image: NetworkImage(state.list![index].avatarUrl), fit: BoxFit.cover),
                                                  borderRadius: BorderRadius.circular(6.r))),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                '${state.list![index].firstName} ${state.list![index].lastName}',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    overflow: TextOverflow.fade,
                                                    fontFamily: 'SF Pro',
                                                    fontSize: 12.sp,
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Text(
                                                state.list![index].title ?? "No title",
                                                style: TextStyle(color: Colors.white, fontFamily: 'SF Pro', fontSize: 10.sp, fontWeight: FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    context.read<UserSubscribeBloc>().add(LoadingFollowersEvent(state.list![index].id!));
                                    context.read<CreatorProfileBloc>().add(CreatorProfileLoadEvent(state.list![index].id!));
                                    context.router.navigateNamed('/creator-page');
                                  },
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is EmptyResultState) {
              return Padding(
                padding: EdgeInsets.only(left: 13.r, right: 13.r),
                child: Column(children: [
                  DiscoverResultHeader(
                    tag: tag,
                    showHashTag: showHashTag,
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    'Creators not found',
                    style: TextStyle(fontFamily: "SF Pro", fontSize: 13.sp, color: ColorsLimitless.textColor),
                  ),
                  Expanded(child: SizedBox())
                ]),
              );
            }
            return Container(
              child: Text(''),
            );
          },
        ),
      ),
    );
  }
}
