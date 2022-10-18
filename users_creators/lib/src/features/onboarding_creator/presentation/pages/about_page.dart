import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/onboarding_creator/bloc/creator_onboarding_bloc.dart';
import 'package:users_creators/src/features/onboarding_creator/domain/creator.dart';
import '../widgets/text_field.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final TextEditingController _aboutController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatorOnboardingBloc, CreatorOnboardingState>(
        builder: (context, state) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.r, vertical: 10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.r,
            ),
            Text(
              '''LET'S GET TO KNOW YOU ABIT. 
ADD A TITLE''',
              style: TextStyle(
                  fontSize: 18.sp,
                  letterSpacing: 0.5,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                  fontFamily: "SF Pro"),
            ),
            SizedBox(
              height: 20.r,
            ),
            Form(
              key: _formKey,
              child: LoginTextField(
                  controller: _aboutController
                    ..value = _aboutController.value
                        .copyWith(text: state.creator.title ?? ''),
                  onChanged: (value) {
                    _formKey.currentState!.validate();
                    setState(() {
                      BlocProvider.of<CreatorOnboardingBloc>(context).add(
                          CreatorOnboardingEvent.addCreatorInfo(
                              creator: state.creator.copyWith(title: value),
                              canGoNext: _aboutController.text.isNotEmpty));
                    });
                  },
                  label: 'Title',
                  validator: (value) =>
                      value!.isEmpty ? 'Title cannot be empty' : null),
            ),
            SizedBox(
              height: 12.r,
            ),
            SizedBox(
              width: 1.sw,
              child: Text(
                'A title is a line of text that describes who you are to your users. Your title will appear both on your profile and in the Discovery section of the app.',
                style: TextStyle(
                    letterSpacing: 0.5,
                    fontFamily: "SF Pro",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF777E90)),
              ),
            ),
            SizedBox(
              height: 8.r,
            ),
            Text(
              '"Personal Trainer"',
              style: TextStyle(
                  fontFamily: "SF Pro",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF777E90)),
            ),
            SizedBox(
              height: 8.r,
            ),
            Text(
              '"Yoga Teacher"',
              style: TextStyle(
                  fontFamily: "SF Pro",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF777E90)),
            ),
            const Expanded(
              child: SizedBox(),
            ),
          ],
        ),
      );
    });
  }
}
