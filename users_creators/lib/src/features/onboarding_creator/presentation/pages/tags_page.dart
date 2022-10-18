import 'package:components/common_widgets/progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/onboarding_creator/bloc/creator_onboarding_bloc.dart';
import '../widgets/tag_list.dart';

class TagsPage extends StatefulWidget {
  const TagsPage({Key? key}) : super(key: key);

  @override
  State<TagsPage> createState() => _TagsPageState();
}

class _TagsPageState extends State<TagsPage> {
  void next(BuildContext context) {
  }

  @override
  void initState(){
    BlocProvider.of<CreatorOnboardingBloc>(context).add(const CreatorOnboardingEvent.getAllTags());
    super.initState();
  }
  final List<String> pressed = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatorOnboardingBloc, CreatorOnboardingState>(
      builder: (context, state) {
        return state.isLoading ? const AppLoadingWidget() : Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.r, vertical: 10.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.r,
                  ),
                  Text(
                    'Select up to 7 tags to describe you and your content.'
                        .toUpperCase(),
                    style: TextStyle(
                        height: 1.5,
                        fontFamily: 'SF Pro',
                        letterSpacing: 0.5,
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        color: const Color(0xFF353945)),
                  ),
                  SizedBox(
                    height: 24.r,
                  ),
                  Wrap(
                    spacing: 8.r,
                    runSpacing: 8.r,
                    children: List.generate(
                        state.allTags.length,
                        (index) => TagList(
                              index: index, onTap: (){
                                BlocProvider.of<CreatorOnboardingBloc>(context).add(
                                  CreatorOnboardingEvent.addCreatorInfo(creator: state.creator, canGoNext: true));
                                BlocProvider.of<CreatorOnboardingBloc>(context).add(
                                CreatorOnboardingEvent.addTags(tags: pressed));
                              }, tag: state.allTags[index].tagName!, pressed: pressed,
                            )),
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
        );
      }
    );
  }
}
