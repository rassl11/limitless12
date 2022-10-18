import 'dart:io';
import 'package:components/common_widgets/progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:users_creators/src/features/onboarding_creator/bloc/creator_onboarding_bloc.dart';

class ProfilePhotoPage extends StatefulWidget {
  const ProfilePhotoPage({Key? key}) : super(key: key);

  @override
  State<ProfilePhotoPage> createState() => _ProfilePhotoPageState();
}

class _ProfilePhotoPageState extends State<ProfilePhotoPage> {
  

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

 File? file;
  Future<File?> _choose() async {
    XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery
    );
    if (pickedFile != null) {
        file = File(pickedFile.path);
        setState(() {});
    return file;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatorOnboardingBloc, CreatorOnboardingState>(
      builder: (context, state) {
        return state.isLoading ? const AppLoadingWidget() : Stack(
            children: [
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.r, vertical: 10.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.r,
                      ),
                      SizedBox(
                        width: 0.8.sw,
                        child: Text(
                          'Last thing! Add a profile picture.'.toUpperCase(),
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
                        height: 50.r,
                      ),
                      Center(
                        child: file == null ?
                        GestureDetector(
                          child: Container(
                            height: 150.r,
                            width: 150.r,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                color: Color(0xFFF4F5F6)),
                            child: Center(
                                child:
                                    SvgPicture.asset('assets/icons/onboarding_creator/add.svg')),
                          ),
                          onTap: ()async {
                            await _choose();
                            // ignore: use_build_context_synchronously
                            BlocProvider.of<CreatorOnboardingBloc>(context).add(
                                  CreatorOnboardingEvent.addCreatorInfo(creator: state.creator, canGoNext: true));
                                  if(file != null){
                            // ignore: use_build_context_synchronously
                            BlocProvider.of<CreatorOnboardingBloc>(context).add(
                              CreatorOnboardingEvent.uploadUserPhoto(photo: file!));
                                  }
                          },
                        ) : Image.file(file!,
                        height: 150.r,
                        width: 150.r,
                        )
                      ),
                      SizedBox(
                        height: 14.r,
                      ),
                      Center(
                        child: Text(
                          'You can change this photo wherever you want!',
                          style: TextStyle(
                              color: Color(0xFF777E90),
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
                  'assets/images/onboarding_creator/profile_image.png',
                  height: 220.r,
                ),
              ),
            ],
        );
      }
    );
  }
}
