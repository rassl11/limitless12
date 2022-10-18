import 'package:auto_route/auto_route.dart';
import 'package:components/common_widgets/progress.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/core/config/router.dart';
import 'package:users_creators/src/features/create_session/bloc/create_session/create_session_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/create_session/create_session_state.dart';
import 'package:users_creators/src/features/create_session/bloc/exercise_list/exercise_list_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/exercise_list/exercise_list_event.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/create_session_exercises_widget.dart';

import '../../bloc/create_session/create_session_event.dart';
import '../widgets/session_top_panel.dart';
import '../widgets/text_field.dart';

class MainFlow extends StatefulWidget {
  final bool isEditing;
  final String? sessionTemplateId;

  const MainFlow({
    Key? key,
    this.isEditing = false,
    this.sessionTemplateId,
  }) : super(key: key);

  @override
  State<MainFlow> createState() => _MainFlowState();
}

class _MainFlowState extends State<MainFlow> {
  @override
  void initState() {
    final createSessionBloc = context.read<CreateSessionBloc>();
    
    createSessionBloc.add(ClearSessionFieldsEvent());
    if (widget.isEditing && widget.sessionTemplateId != null) {
      BaseCreateSessionState.id = widget.sessionTemplateId ?? '';
      createSessionBloc.add(GetSessionByIdEvent(
        sessionId: widget.sessionTemplateId!,
      ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorsLimitless.backgroundColor,
      body: BlocBuilder<CreateSessionBloc, BaseCreateSessionState>(
        builder: (context, state) {
          if (state is CreatingSessionState) {
            return const AppLoadingWidget();
          }
          if (state is DefaultSessionState) {
            return GestureDetector(
              child: Container(
                color: Colors.transparent,
                height: 1.sh,
                width: 1.sw,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 5.r, bottom: 17.r),
                      color: Colors.white,
                      child: SafeArea(
                        bottom: false,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15.r, right: 20.r),
                          child: SessionTopPanel(
                            baseContext: context,
                            isEditing: widget.isEditing,
                            name: state.name,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SafeArea(
                        top: false,
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            Stack(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset('assets/icons/create_session/info.svg'),
                                          SizedBox(
                                            width: 6.r,
                                          ),
                                          Text(
                                            'Session Instructions',
                                            style: TextStyle(
                                                fontFamily: 'SF Pro',
                                                fontSize: 12.sp,
                                                letterSpacing: 0.5,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 14.r,
                                    ),
                                    TextFieldSession(
                                      isEditing: widget.isEditing,
                                      instructions: state.instructions,
                                    ),
                                    SizedBox(
                                      height: 14.r,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 14.r),
                                      child: const CreateSessionExercisesWidget(),
                                    ),
                                    SizedBox(
                                      height: 10.r,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 14.r),
                                      child: GestureDetector(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 12.r),
                                          decoration: BoxDecoration(
                                              border: Border.all(color: ColorsLimitless.greyMedium),
                                              borderRadius: BorderRadius.circular(6.r)),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/create_session/add.svg'),
                                              SizedBox(
                                                width: 5.r,
                                              ),
                                              Text(
                                                'Add exercise',
                                                style: TextStyle(
                                                    fontFamily: "SF Pro",
                                                    fontSize: 12.sp,
                                                    letterSpacing: 0.5,
                                                    fontWeight: FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          context.read<ExerciseListBloc>().add(ExerciseLoadEvent());
                                          context.router.push(ExerciseListPageRoute(
                                              trainingSessionPart: false,
                                              indexOfExercise: 0,
                                              swap: false));
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.r,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
