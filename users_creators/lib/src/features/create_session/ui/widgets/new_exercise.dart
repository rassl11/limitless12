import 'package:components/buttons/app_buttons.dart';
import 'package:components/common_widgets/progress.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/create_session/bloc/create_exercise/create_exercise_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/create_exercise/create_exercise_event.dart';
import 'package:users_creators/src/features/create_session/bloc/create_exercise/create_exercise_state.dart';
import 'package:users_creators/src/features/create_session/bloc/exercise_info/exercise_info_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/exercise_info/exercise_info_state.dart';
import 'package:users_creators/src/features/create_session/bloc/exercise_list/exercise_list_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/exercise_list/exercise_list_event.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/drop_down_widget.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/new_exercixe_text.dart';

class NewExercise extends StatefulWidget {
  NewExercise({Key? key}) : super(key: key);

  @override
  State<NewExercise> createState() => _NewExerciseState();
}

class _NewExerciseState extends State<NewExercise> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController youtubeController = TextEditingController();

  String? typeOfExercise;

  String? equipment;

  String? primaryMuscle;

  String? otherMuscle;

  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseInfoBloc, ExerciseInfoState>(
        builder: (context, state) {
      if (state is LoadedExerciseInfoState) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.r),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.white,
            ),
            padding: EdgeInsets.symmetric(horizontal: 18.r, vertical: 14.r),
            height: 0.9.sh,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'New exercise',
                              style: TextStyle(
                                  fontFamily: "SF Pro",
                                  fontSize: 22.sp,
                                  color: ColorsLimitless.textColor,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          GestureDetector(
                            child: SvgPicture.asset(
                                'assets/icons/workout_popup/close.svg'),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SingleChildScrollView(
                                padding: EdgeInsets.zero,
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 15.r,
                                      ),
                                      Text(
                                        'Title',
                                        style: TextStyle(
                                            fontFamily: 'SF Pro',
                                            fontSize: 12.sp,
                                            letterSpacing: 0.5,
                                            color: ColorsLimitless.textColor,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 10.r,
                                      ),
                                      NewExerciseText(
                                          controller: titleController,
                                          showIcon: Padding(
                                              padding: EdgeInsets.all(11.r),
                                              child: SizedBox()),
                                          validator: (String? value) {
                                            if (value!.isEmpty) {
                                              return 'Title can\'t be empty';
                                            }
                                          }),
                                      SizedBox(
                                        height: 15.r,
                                      ),
                                      Text(
                                        'Type of exercises',
                                        style: TextStyle(
                                            fontFamily: 'SF Pro',
                                            fontSize: 12.sp,
                                            letterSpacing: 0.5,
                                            color: ColorsLimitless.textColor,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 10.r,
                                      ),
                                      DropDown(
                                        updateValue: (value) {
                                          typeOfExercise = value;
                                          setState(() {});
                                        },
                                        index: 0,
                                        items: state.typeOfExercise,
                                        selectedValue: typeOfExercise,
                                      ),
                                      pressed == true && typeOfExercise == null
                                          ? Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.r, top: 5.r),
                                              child: Text(
                                                'Type of exercise can\'t be empy',
                                                style: TextStyle(
                                                    color: ColorsLimitless
                                                        .brandColor,
                                                    fontFamily: 'SF Pro',
                                                    fontSize: 10.sp,
                                                    letterSpacing: 0.5),
                                              ))
                                          : SizedBox(),
                                      SizedBox(
                                        height: 15.r,
                                      ),
                                      Text(
                                        'Equipment used',
                                        style: TextStyle(
                                            fontFamily: 'SF Pro',
                                            fontSize: 12.sp,
                                            letterSpacing: 0.5,
                                            color: ColorsLimitless.textColor,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 10.r,
                                      ),
                                      DropDown(
                                        updateValue: (value) {
                                          equipment = value;
                                          setState(() {});
                                        },
                                        index: 1,
                                        items: state.equipment,
                                        selectedValue: equipment,
                                      ),
                                      pressed == true && equipment == null
                                          ? Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.r, top: 5.r),
                                              child: Text(
                                                'Equipment can\'t be empy',
                                                style: TextStyle(
                                                    color: ColorsLimitless
                                                        .brandColor,
                                                    fontFamily: 'SF Pro',
                                                    fontSize: 10.sp,
                                                    letterSpacing: 0.5),
                                              ))
                                          : SizedBox(),
                                      SizedBox(
                                        height: 15.r,
                                      ),
                                      Text(
                                        'Primary Muscle Group',
                                        style: TextStyle(
                                            fontFamily: 'SF Pro',
                                            fontSize: 12.sp,
                                            letterSpacing: 0.5,
                                            color: ColorsLimitless.textColor,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 10.r,
                                      ),
                                      DropDown(
                                        updateValue: (value) {
                                          primaryMuscle = value;
                                          setState(() {});
                                        },
                                        index: 2,
                                        items: state.primaryMuscle,
                                        selectedValue: primaryMuscle,
                                      ),
                                      pressed == true && primaryMuscle == null
                                          ? Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.r, top: 5.r),
                                              child: Text(
                                                'Primart muscle can\'t be empty',
                                                style: TextStyle(
                                                    color: ColorsLimitless
                                                        .brandColor,
                                                    fontFamily: 'SF Pro',
                                                    fontSize: 10.sp,
                                                    letterSpacing: 0.5),
                                              ))
                                          : SizedBox(),
                                      SizedBox(
                                        height: 15.r,
                                      ),
                                      Text(
                                        'Other Muscle (optional)',
                                        style: TextStyle(
                                            fontFamily: 'SF Pro',
                                            fontSize: 12.sp,
                                            letterSpacing: 0.5,
                                            color: ColorsLimitless.textColor,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 10.r,
                                      ),
                                      DropDown(
                                        updateValue: (value) {
                                          otherMuscle = value;
                                          setState(() {});
                                        },
                                        index: 3,
                                        items: state.otherMuscle,
                                        selectedValue: otherMuscle,
                                      ),
                                      pressed == true && otherMuscle == null
                                          ? Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.r, top: 5.r),
                                              child: Text(
                                                'Other muscle can\'t be empy',
                                                style: TextStyle(
                                                    color: ColorsLimitless
                                                        .brandColor,
                                                    fontFamily: 'SF Pro',
                                                    fontSize: 10.sp,
                                                    letterSpacing: 0.5),
                                              ),
                                            )
                                          : SizedBox(),
                                      SizedBox(
                                        height: 15.r,
                                      ),
                                      Text(
                                        'Exercise description',
                                        style: TextStyle(
                                            fontFamily: 'SF Pro',
                                            fontSize: 12.sp,
                                            letterSpacing: 0.5,
                                            color: ColorsLimitless.textColor,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 10.r,
                                      ),
                                      NewExerciseText(
                                          controller: descriptionController,
                                          showIcon: const SizedBox(),
                                          validator: (String? value) {
                                            if (value!.isEmpty) {
                                              return 'Exercise description can\'t be empty';
                                            }
                                            return null;
                                          }),
                                      SizedBox(
                                        height: 15.r,
                                      ),
                                      Text(
                                        'Youtube link',
                                        style: TextStyle(
                                            fontFamily: 'SF Pro',
                                            fontSize: 12.sp,
                                            letterSpacing: 0.5,
                                            color: ColorsLimitless.textColor,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 10.r,
                                      ),
                                      NewExerciseText(
                                          controller: youtubeController,
                                          showIcon: SizedBox(),
                                          validator: (String? value) {
                                            if (value!.isEmpty) {
                                              return 'Youtube link can\'t be empty';
                                            }
                                            return null;
                                          }),
                                      SizedBox(
                                        height: 20.r,
                                      ),
                                      AppButtons().redButton(context, 'Create',
                                          () {
                                        setState(() {
                                          pressed = true;
                                        });

                                        if (_formKey.currentState!.validate() &&
                                            typeOfExercise != null &&
                                            equipment != null &&
                                            primaryMuscle != null &&
                                            otherMuscle != null) {
                                          CreateExerciseState.title =
                                              titleController.text;
                                          CreateExerciseState.youtubeLink =
                                              youtubeController.text;
                                          CreateExerciseState
                                                  .exerciseDescription =
                                              descriptionController.text;

                                          context
                                              .read<CreateExerciseBloc>()
                                              .add(CreateNewExerciseEvent());

                                          context
                                              .read<ExerciseListBloc>()
                                              .add(ExerciseLoadEvent());

                                          Navigator.pop(context);
                                        }
                                      })
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }
      return AppLoadingWidget();
    });
  }
}
