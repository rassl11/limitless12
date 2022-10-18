import 'package:components/common_widgets/progress.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/exercise_list/exercise_list_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/exercise_list/exercise_list_state.dart';
import 'package:users_creators/src/features/create_session/entity/domain/exercise_model.dart';
import 'package:users_creators/src/features/library/ui/widgets/create_session_button.dart';
import 'package:users_creators/src/features/library/ui/widgets/tabs/exercise_tab_view.dart';
import 'package:users_creators/src/features/library/ui/widgets/tabs/tab_widget.dart';

import '../tab_bar/tab_bar_widget.dart';

class ExerciseTabs extends StatefulWidget {
  final bool selectable;
  final bool swap;
  final int index;
  const ExerciseTabs({
    Key? key,
    required this.selectable,
    required this.index,
    required this.swap,
  }) : super(key: key);
  @override
  State<ExerciseTabs> createState() => _ExerciseTabsState();
}

class _ExerciseTabsState extends State<ExerciseTabs>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List<ExerciseModel> selectedExercises = [];

  void select(ExerciseModel exercise) {
    if (selectedExercises.contains(exercise)) {
      selectedExercises.remove(exercise);
    } else {
      selectedExercises.add(exercise);
    }
  }

  void selectSwap(ExerciseModel exercise) {
    if (selectedExercises.isNotEmpty) {
      selectedExercises.clear();
      selectedExercises.add(exercise);
    } else {
      selectedExercises.add(exercise);
    }
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseListBloc, ExerciseListState>(
        builder: (context, state) {
      if (state is ExerciseLoadingListState) {
        return const Expanded(child: AppLoadingWidget());
      }
      if (state is ExerciseErrorListState) {
        return const Center(
          child: Text('Something went wrong'),
        );
      }

      if (state is ExerciseEmptyListState) {
        return const Center(
          child: Text('No exercises yet'),
        );
      }
      if (state is ExerciseLoadedListState) {
        return Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: TabBarWidget(
                        tabController: _tabController,
                        tabs: const [
                          TabWidget(title: 'Exercises'),
                          TabWidget(title: 'My Exercises'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: ColorsLimitless.backgroundColor,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          ExerciseTabView(
                            swap: widget.swap,
                            exerciseList: state.basicExerciseList,
                            isMine: false,
                            onSelection: (exercise) {
                              widget.swap == false
                                  ? select(exercise)
                                  : selectSwap(exercise);
                              setState(() {});
                            },
                            selectedValues: selectedExercises,
                            selectable: widget.selectable,
                          ),
                          ExerciseTabView(
                            swap: widget.swap,
                            exerciseList: state.myExerciseList,
                            isMine: true,
                            onSelection: (exercise) {
                                  widget.swap == false
                                  ? select(exercise)
                                  : selectSwap(exercise);
                              setState(() {});
                            },
                            selectedValues: selectedExercises,
                            selectable: widget.selectable,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (selectedExercises.isNotEmpty)
              CreateSessionButton(
                index: widget.index,
                  swap: widget.swap, 
                  selectedExercises: selectedExercises)
          ],
        );
      }
      return const SizedBox();
    });
  }
}
