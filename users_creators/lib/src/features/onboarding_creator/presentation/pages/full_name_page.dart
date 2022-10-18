import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/onboarding_creator/bloc/creator_onboarding_bloc.dart';
import 'package:users_creators/src/features/onboarding_creator/domain/creator.dart';

import '../widgets/text_field.dart';

class FullNamePage extends StatefulWidget {
  const FullNamePage({Key? key}) : super(key: key);

  @override
  State<FullNamePage> createState() => _FullNamePageState();
}

class _FullNamePageState extends State<FullNamePage> {
  final TextEditingController _userNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

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
              'WHAT\'S YOUR NAME',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                  fontFamily: "SF Pro"),
            ),
            SizedBox(
              height: 20.r,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  LoginTextField(
                      onChanged: (value) {
                        _formKey.currentState!.validate();
                        setState(() {
                            BlocProvider.of<CreatorOnboardingBloc>(context).add(
                                CreatorOnboardingEvent.addCreatorInfo(
                                    creator: state.creator.copyWith(firstName: value), canGoNext: _userNameController.text.isNotEmpty && _lastNameController.text.isNotEmpty));
                          
                        });
                      },
                      controller: _userNameController..value = _userNameController.value.copyWith(text: state.creator.firstName ?? ''),
                      label: 'First name',
                      validator: (value) => value!.isEmpty
                          ? 'Username cannot be empty'
                          : null),
                  SizedBox(
                    height: 20.r,
                  ),
                  LoginTextField(
                      onChanged: (value) {
                        _formKey.currentState!.validate();
                        setState(() {
                            BlocProvider.of<CreatorOnboardingBloc>(context).add(
                                CreatorOnboardingEvent.addCreatorInfo(
                                    creator: state.creator.copyWith(lastName: value), canGoNext:  _userNameController.text.isNotEmpty && _lastNameController.text.isNotEmpty));
                        
                        });
                      },
                      controller: _lastNameController..value = _lastNameController.value.copyWith(text: state.creator.lastName ?? ''),
                      label: 'Last Name',
                      validator: (value) => value!.isEmpty
                          ? 'Last Name cannot be empty'
                          : null),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      );
    });
  }
}
