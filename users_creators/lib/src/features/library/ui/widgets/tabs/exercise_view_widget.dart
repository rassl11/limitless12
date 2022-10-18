import 'package:components/common_widgets/scroll_behavior.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/create_session/bloc/exercise_list/exercise_list_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/exercise_list/exercise_list_event.dart';
import 'package:users_creators/src/features/create_session/bloc/exercise_list/exercise_list_state.dart';
import 'package:users_creators/src/features/create_session/entity/domain/exercise_model.dart';
import 'package:users_creators/src/features/library/ui/widgets/create_session_button.dart';
import 'package:users_creators/src/features/library/ui/widgets/exercise_list_widget.dart';
import 'package:users_creators/src/features/library/ui/widgets/exercise_search_field.dart';
import 'package:users_creators/src/features/library/ui/widgets/my_exercise_list_widget.dart';
import 'package:users_creators/src/features/library/ui/widgets/search_not_found_widget.dart';
import 'package:users_creators/src/features/library/ui/widgets/tabs/exercise_tabs.dart';

class ExerciseViewWidget extends StatefulWidget {
  final bool selectable;
  final bool swap;
  final int index;
  const ExerciseViewWidget({
    Key? key,
    required this.selectable, 
    required this.index,
    required this.swap})
    : super(key: key);

  @override
  State<ExerciseViewWidget> createState() => _ExerciseViewWidgetState();
}

class _ExerciseViewWidgetState extends State<ExerciseViewWidget> {
  final FocusNode _focus = FocusNode();
  bool isSearchEnabled = false;
  String searchText = '';
  final controller = TextEditingController();
  List<ExerciseModel> selectedExercises = [];


  void select(ExerciseModel exercise) {
    if (selectedExercises.contains(exercise)) {
      selectedExercises.remove(exercise);
    } else {
      selectedExercises.add(exercise);
    }
  }


  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    setState(() {
      isSearchEnabled = _focus.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: isSearchEnabled ? 0.75.sw : 0.90.sw,
                      height: 35.r,
                      child: ExerciseSearchField(
                        focusNode: _focus,
                        onChanged: (value) {
                          setState(() {
                            searchText = value;
                            if (value.isNotEmpty) {
                              BlocProvider.of<ExerciseListBloc>(context)
                                  .add(SearchExerciseEvent(value: value));
                            }
                          });
                        },
                        controller: controller,
                      )),
                  if (isSearchEnabled)
                    SizedBox(
                      width: 15.w,
                    ),
                  if (isSearchEnabled)
                    GestureDetector(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            fontFamily: 'SF Pro',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.5,
                            color: ColorsLimitless.brandColor),
                      ),
                      onTap: () {
                        controller.clear();
                        setState(() {
                          isSearchEnabled = false;
                          searchText = '';
                        });

                        _focus.unfocus();
                        context
                            .read<ExerciseListBloc>()
                            .add(ExerciseLoadEvent());
                      },
                    )
                ],
              )),
        ),
        BlocBuilder<ExerciseListBloc, ExerciseListState>(
            builder: (context, state) {
          if (state is ExerciseEmptyListState) {
            return const SearchNotFoundWidget();
          }
          if (state is ExerciseErrorListState) {
            return const SearchNotFoundWidget();
          }
          if (state is ExerciseLoadingListState) {
            return const Expanded(
                child: Center(
                    child: CircularProgressIndicator(
              color: ColorsLimitless.brandColor,
            )));
          }
          if (state is ExerciseLoadedListState) {
            return searchText.isNotEmpty
                ? Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  if (state.myExerciseList.isNotEmpty)
                                    Text(
                                      'My Exercises (${state.myExerciseList.length})',
                                      style: TextStyle(
                                          color: ColorsLimitless.greyLight,
                                          fontSize: 14.sp,
                                          fontFamily: 'SF Pro',
                                          fontWeight: FontWeight.w400),
                                    ),
                                  if (state.myExerciseList.isNotEmpty)
                                    ScrollConfiguration(
                                      behavior: AppScrollBehavior(),
                                      child: MyExerciseListWidget(
                                        swap: widget.swap,
                                        exerciseList: state.myExerciseList,
                                        selectable: widget.selectable,
                                        onSelection: (exercise) {
                                          setState(() {
                                            select(exercise);
                                          });
                                        },
                                        selectedValues: selectedExercises,
                                        isScrolling: false,
                                      ),
                                    ),
                                  if (state.basicExerciseList.isNotEmpty)
                                    Text(
                                      'Exercises (${state.basicExerciseList.length})',
                                      style: TextStyle(
                                          color: ColorsLimitless.greyLight,
                                          fontSize: 14.sp,
                                          fontFamily: 'SF Pro',
                                          fontWeight: FontWeight.w400),
                                    ),
                                  if (state.basicExerciseList.isNotEmpty)
                                    ScrollConfiguration(
                                      behavior: AppScrollBehavior(),
                                      child: ExerciseListWidget(
                                        swap: widget.swap,
                                        exerciseList: state.basicExerciseList,
                                        onSelection: (exercise) {
                                          setState(() {
                                            select(exercise);
                                          });
                                        },
                                        selectedValues: selectedExercises,
                                        selectable: widget.selectable,
                                        isScrolling: false,
                                      ),
                                    ),
                                  if (state.myExerciseList.isEmpty &&
                                      state.basicExerciseList.isEmpty)
                                    const SearchNotFoundWidget()
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (selectedExercises.isNotEmpty)
                          CreateSessionButton(
                            index: widget.index,
                            swap: widget.swap,
                              selectedExercises: selectedExercises)
                      ],
                    ),
                  )
                : isSearchEnabled
                    ? const Expanded(
                        child: Padding(
                            padding: EdgeInsets.all(25),
                            child: Center(
                                child: Text(
                              'Please type your request for search exercises',
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: ColorsLimitless.greyMedium,
                                  fontFamily: 'SF Pro',
                                  letterSpacing: 0.5,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ))),
                      )
                    : Expanded(
                        child: ExerciseTabs(
                          index: widget.index,
                        swap: widget.swap,
                        selectable: widget.selectable,
                      ));
          }
          return const Offstage();
        })
      ],
    );
  }
}
