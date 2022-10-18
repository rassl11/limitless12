import 'dart:ui';

import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../entity/domain/creator_questionnaire.dart';
import '../../../repo/creator_repo.dart';
import 'widgets/close_icon.dart';
import 'widgets/form.dart';
import 'widgets/tags.dart';
import 'widgets/stepper_dots.dart';

showQuestionnaireDialog(
  BuildContext context, {
  required CreatorQuestionnaire creatorQuestionnaire,
  required String fullName,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    _MainBody(
                      creatorQuestionnaire: creatorQuestionnaire,
                      fullName: fullName,
                    ),
                    const CloseIcon(),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

class _MainBody extends StatefulWidget {
  final CreatorQuestionnaire creatorQuestionnaire;
  final String fullName;

  const _MainBody({
    Key? key,
    required this.creatorQuestionnaire,
    required this.fullName,
  }) : super(key: key);

  @override
  State<_MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<_MainBody> {
  final formKey = GlobalKey<FormState>();
  late final PageController pageController;
  final questionsMap = <String, String>{};
  late final int pageviewPagesLength;

  int currentPage = 0;

  final questionAnswersMap = <String, String>{};
  final formAnswersMap = <String, String>{};
  String? selectedTag;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    if (widget.creatorQuestionnaire.questions != null) {
      for (var question in widget.creatorQuestionnaire.questions!) {
        questionsMap[question.id] = question.title ?? '';
      }
    }
    pageviewPagesLength = questionsMap.length + 2;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * .8,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: Colors.white,
        ),
        padding: EdgeInsets.only(
          left: 21.r,
          right: 21.r,
          bottom: 21.r,
          top: 29.r,
        ),
        margin: EdgeInsets.symmetric(horizontal: 12.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.fullName,
                style: TextStyle(
                  color: ColorsLimitless.greyDark,
                  fontSize: 16.sp,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 7.0.h),
              Text(
                "Online coaching",
                style: TextStyle(
                  color: ColorsLimitless.greyDark,
                  fontSize: 26.sp,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 11.0.h),
              Text(
                currentPage == 0
                    ? "How can I help you?"
                    : currentPage == pageviewPagesLength - 1
                        ? 'Your contact information'
                        : questionsMap.values.elementAt(currentPage - 1),
                style: TextStyle(
                  color: ColorsLimitless.greyDark,
                  fontSize: 18.sp,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 21.0.h),
              StepperDots(
                stepsCount: pageviewPagesLength,
                currentStep: currentPage,
              ),
              SizedBox(height: 21.0.h),
              Expanded(
                child: PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (page) => setState(() => currentPage = page),
                  children: [
                    TagsList(
                      tags: widget.creatorQuestionnaire.tags ?? [],
                      selectedTag: selectedTag,
                      onTap: (tag) => setState(() => selectedTag = tag),
                    ),
                    ...List.generate(questionsMap.length, (index) {
                      final question = questionsMap.entries.elementAt(index);

                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: Colors.transparent,
                          border: Border.all(
                            color: const Color(0xFFE6E8EC),
                          ),
                        ),
                        child: Material(
                          elevation: 0.0,
                          color: Colors.transparent,
                          child: TextFormField(
                            maxLines: null,
                            initialValue: questionAnswersMap.keys
                                    .where(
                                        (e) => e.startsWith(index.toString()))
                                    .isEmpty
                                ? ''
                                : questionAnswersMap.entries
                                    .where((entry) {
                                      final splittedKey = entry.key.split(' ');
                                      return splittedKey.last == question.key;
                                    })
                                    .first
                                    .value,
                            onChanged: (value) {
                              setState(() {
                                questionAnswersMap.update(
                                  '$index ${question.key}',
                                  (_) => value,
                                  ifAbsent: () => value,
                                );
                              });
                            },
                            decoration: InputDecoration(
                              hintText: "Type your message",
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 15.h,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      );
                    }),
                    FormWidget(
                      formKey: formKey,
                      callback: (mapEntry) {
                        formAnswersMap.update(
                          mapEntry.key,
                          (value) => mapEntry.value,
                          ifAbsent: () => mapEntry.value,
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 22.0.h),
              Material(
                borderRadius: BorderRadius.circular(6.r),
                child: InkWell(
                  onTap: !nextBtnActivityHandle() ? null : handleNextBtnClick,
                  borderRadius: BorderRadius.circular(6.r),
                  splashFactory: InkRipple.splashFactory,
                  splashColor: const Color(0xFFBA4454),
                  child: Ink(
                    padding: EdgeInsets.zero,
                    height: 0.055.sh,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: !nextBtnActivityHandle()
                          ? const Color(0xFFECAAAA)
                          : const Color(0xFFE94359),
                    ),
                    child: Center(
                      child: Text(
                        currentPage == pageviewPagesLength - 1
                            ? 'Submit'
                            : 'Next',
                        style: TextStyle(
                          color: const Color(0xFFFCFCFD),
                          fontFamily: "SF Pro",
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (currentPage > 0) ...[
                SizedBox(height: 12.0.h),
                Material(
                  borderRadius: BorderRadius.circular(6.r),
                  child: InkWell(
                    onTap: () {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                    },
                    borderRadius: BorderRadius.circular(6.r),
                    splashFactory: InkRipple.splashFactory,
                    child: Ink(
                      padding: EdgeInsets.zero,
                      height: 0.055.sh,
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          'Back',
                          style: TextStyle(
                            color: ColorsLimitless.greyDark,
                            fontFamily: "SF Pro",
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }

  bool nextBtnActivityHandle() {
    if (currentPage == 0) {
      if (selectedTag == null) return false;
      return true;
    } else if (currentPage > 0 &&
            currentPage < pageviewPagesLength - 1 &&
            questionAnswersMap.keys
                .where((e) => e.startsWith((currentPage - 1).toString()))
                .isEmpty ||
        (questionAnswersMap.entries
                .where((e) => e.key.startsWith((currentPage - 1).toString()))
                .isNotEmpty &&
            questionAnswersMap.entries
                .where((e) => e.key.startsWith((currentPage - 1).toString()))
                .last
                .value
                .isEmpty)) {
      return false;
    }
    return true;
  }

  void handleNextBtnClick() async {
    if (currentPage < pageviewPagesLength - 1) {
      pageController.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    } else if (currentPage == pageviewPagesLength - 1) {
      if (formKey.currentState!.validate()) {
        formKey.currentState?.save();

        final isSuccess = await context
            .read<CreatorRepository>()
            .createCreatorServiceQuestionnaireAnswer(
              creatorId: widget.creatorQuestionnaire.creatorUserId,
              selectedTag: selectedTag!,
              questionAnswersMap: questionAnswersMap,
              formAnswersMap: formAnswersMap,
              fullName: widget.fullName,
            );

        if (isSuccess) _showThanksForSigningUpDialog(context);
      }
    }
  }
}

_showThanksForSigningUpDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 304.w,
                      height: 320.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 12.sp),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Positioned(
                            top: 0,
                            child: SvgPicture.asset(
                              'assets/images/creator/service_questionnaire_answers_complete.svg',
                              height: 168.h,
                              width: double.infinity,
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 36.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Thanks for signing up!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorsLimitless.greyDark,
                                      fontSize: 32.sp,
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.w800,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  SizedBox(height: 24.h),
                                  Text(
                                    "I'll be in touch soon.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFF777E91),
                                      fontSize: 16.sp,
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 24.h,
                            child: Material(
                              borderRadius: BorderRadius.circular(6.r),
                              elevation: 0.0,
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(6.r),
                                splashFactory: InkRipple.splashFactory,
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  width: 256.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.r),
                                    color: Colors.transparent,
                                    border: Border.all(
                                      color: const Color(0xFFB1B5C3),
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 12.h),
                                  child: Center(
                                    child: Text(
                                      'Continue',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: ColorsLimitless.greyDark,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const CloseIcon(),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
