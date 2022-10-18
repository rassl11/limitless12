import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users_creators/src/features/create_session/bloc/exercise_list/exercise_list_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/exercise_list/exercise_list_state.dart';
import 'package:users_creators/src/features/library/ui/widgets/tabs/exercise_view_widget.dart';

class ExerciseListPage extends StatefulWidget {
  const ExerciseListPage({
    Key? key,
    required this.swap,
    required this.indexOfExercise,
    required this.trainingSessionPart,
  }) : super(key: key);
  final bool swap;
  final int indexOfExercise;
  final bool trainingSessionPart;

  @override
  State<ExerciseListPage> createState() => _ExerciseListPageState();
}

class _ExerciseListPageState extends State<ExerciseListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromRGBO(244, 245, 246, 1),
      body: BlocBuilder<ExerciseListBloc, ExerciseListState>(
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(children: [
                      SafeArea(
                        bottom: false,
                        child: SizedBox(
                          height: 40.h,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Exercises',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'SF Pro',
                                        fontSize: 15.sp,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: IconButton(
                                  onPressed: () {
                                    context.router.navigateBack();
                                  },
                                  icon: SvgPicture.asset(
                                    'assets/icons/top_panel/left_arrow.svg',
                                    color: Colors.black,
                                    height: 11.r,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Expanded(
                    child: ExerciseViewWidget(
                      index: widget.indexOfExercise,
                      selectable: true,
                      swap: widget.swap,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
