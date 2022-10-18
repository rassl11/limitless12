import 'dart:io';
import 'package:components/common_widgets/progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:users_creators/src/features/onboarding_creator/bloc/creator_onboarding_bloc.dart';

class CoverPhotoPage extends StatefulWidget {
  const CoverPhotoPage({Key? key}) : super(key: key);

  @override
  State<CoverPhotoPage> createState() => _CoverPhotoPageState();
}

class _CoverPhotoPageState extends State<CoverPhotoPage> {
  File? file;
  Future<File?> _choose() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      file = File(pickedFile.path);
      setState(() {});
      return file;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final creatorOnboardingBloc =
        BlocProvider.of<CreatorOnboardingBloc>(context);

    return BlocBuilder<CreatorOnboardingBloc, CreatorOnboardingState>(
        builder: (context, state) {
      return state.isLoading
          ? const AppLoadingWidget()
          : Stack(
              children: [
                SafeArea(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.r, vertical: 10.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30.r,
                        ),
                        SizedBox(
                          width: 0.8.sw,
                          child: Text(
                            'Great! add Cover photo for your fitness journey thumb'
                                .toUpperCase(),
                            style: TextStyle(
                                fontSize: 18.sp,
                                letterSpacing: 0.7,
                                height: 1.6,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w700,
                                fontFamily: "SF Pro"),
                          ),
                        ),
                        SizedBox(
                          height: 20.r,
                        ),
                        Center(
                            child: file == null
                                ? GestureDetector(
                                    child: Container(
                                      height: 150.r,
                                      width: 150.r,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6.r),
                                          color: const Color(0xFFF4F5F6)),
                                      child: Center(
                                          child: SvgPicture.asset(
                                              'assets/icons/onboarding_creator/add.svg')),
                                    ),
                                    onTap: () async {
                                      await _choose();

                                      creatorOnboardingBloc.add(
                                        CreatorOnboardingEvent.addCreatorInfo(
                                          creator: state.creator,
                                          canGoNext: true,
                                        ),
                                      );
                                      if (file != null) {
                                        creatorOnboardingBloc.add(
                                          CreatorOnboardingEvent
                                              .uploadCoverImage(
                                            photo: file!,
                                          ),
                                        );
                                      }
                                    },
                                  )
                                : Image.file(
                                    file!,
                                    height: 150.r,
                                    width: 150.r,
                                  )),
                        SizedBox(
                          height: 14.r,
                        ),
                        Center(
                          child: Text(
                            '“Follow my Fitness Joureny" thumbnail',
                            style: TextStyle(
                                color: const Color(0xFF777E90),
                                fontFamily: "SF Pro",
                                letterSpacing: 0.5,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const FractionalOffset(0.5, 0.83),
                  child: Image.asset(
                    'assets/images/onboarding_creator/cover_image.png',
                    height: 220.r,
                  ),
                ),
              ],
            );
    });
  }
}
