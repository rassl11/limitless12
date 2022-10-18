import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/onboarding_creator/bloc/creator_onboarding_bloc.dart';
import 'package:users_creators/src/features/onboarding_creator/domain/creator.dart';

import '../widgets/text_field.dart';

class TikTokPage extends StatefulWidget {
  const TikTokPage({Key? key}) : super(key: key);

  @override
  State<TikTokPage> createState() => _TikTokPageState();
}

class _TikTokPageState extends State<TikTokPage> {
  final TextEditingController _tikTokController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    _tikTokController.dispose();
    super.dispose();
  }

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
                    'YOUR TIKTOK HANDLE',
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
                    child: LoginTextField(
                      onChanged: (value){
                        _formKey.currentState!.validate();
                            setState(() {
                                BlocProvider.of<CreatorOnboardingBloc>(context).add(
                                    CreatorOnboardingEvent.addCreatorInfo(
                                        creator: state.creator.copyWith(tikTok: value), canGoNext: true));
                            
                            });
                      },
                        controller: _tikTokController..value = _tikTokController.value.copyWith(text: state.creator.tikTok ?? ''),
                        label: 'Tiktok',
                        validator: null),
                  ),
                  const Expanded(child: SizedBox())
                ],
              ),
        );
      }
    );
  }
}
