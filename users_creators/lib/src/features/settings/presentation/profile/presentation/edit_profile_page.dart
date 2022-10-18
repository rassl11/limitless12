import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:components/buttons/app_buttons.dart';
import 'package:components/common_widgets/progress.dart';
import 'package:components/theme/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:users_creators/src/features/settings/presentation/profile/bloc/profile_bloc.dart';
import 'package:users_creators/src/features/settings/presentation/profile/domain/edited_user.dart';
import 'package:users_creators/src/features/settings/presentation/profile/domain/profile.dart';
import 'package:users_creators/src/features/settings/presentation/profile/presentation/widgets/calendar_text_field.dart';
import 'package:users_creators/src/features/settings/presentation/profile/presentation/widgets/edit_password_widget.dart';
import 'package:users_creators/src/features/settings/presentation/profile/presentation/widgets/edit_profile_text_field.dart';
import 'package:users_creators/src/features/settings/presentation/profile/presentation/widgets/popup_field.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  int gender = 0;

  String date = '';
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
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return state.map(
          initial: (state) {
            final Profile user = state.profile;
            return Scaffold(
              backgroundColor: Colors.white,
              resizeToAvoidBottomInset: true,
              body: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width,
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: IntrinsicHeight(
                    child: SafeArea(
                      child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 14.r,
                              ),
                              Row(children: [
                                GestureDetector(
                                  child: SvgPicture.asset(
                                    'assets/icons/top_panel/left_arrow.svg',
                                    color: ColorsLimitless.greyDark,
                                    // height: 13.r,
                                  ),
                                  onTap: () {
                                    context.router.navigateBack();
                                  },
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                  'Edit Profile',
                                  style: TextStyle(
                                      color: ColorsLimitless.greyDark,
                                      fontFamily: 'SF Pro',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  width: 13.r,
                                ),
                                const Expanded(child: SizedBox())
                              ]),
                              SizedBox(
                                height: 28.r,
                              ),
                              InkWell(
                                onTap: () async {
                                  await _choose();
                                  BlocProvider.of<ProfileBloc>(context).add(
                                      ProfileEvent.uploadUserPhoto(
                                          photo: file!));
                                },
                                child: state.profile.avatarUrl!.isEmpty
                                    ? Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: ColorsLimitless.greyLight
                                                .withOpacity(0.3)),
                                        child: Padding(
                                            padding: EdgeInsets.all(32.r),
                                            child: Center(
                                                child: SvgPicture.asset(
                                              'assets/icons/settings/camera.svg',
                                              color: Colors.black,
                                              height: 22.r,
                                            ))),
                                      )
                                    : Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  state.profile.avatarUrl!,
                                                ))),
                                      ),
                              ),
                              SizedBox(
                                height: 33.r,
                              ),
                              EditProfileTextField(
                                hintText: 'Type your first name',
                                title: 'First Name',
                                textEditingController: _firstNameController
                                  ..value = _firstNameController.value
                                      .copyWith(text: user.firstName ?? ''),
                                onChanged: (value) {
                                  user.firstName = value;
                                  setState(() {});
                                },
                              ),
                              EditProfileTextField(
                                hintText: 'Type your last name',
                                title: 'Last Name',
                                textEditingController: _lastNameController
                                  ..value = _lastNameController.value
                                      .copyWith(text: user.lastName ?? ''),
                                onChanged: (value) {
                                  user.lastName = value;
                                  setState(() {});
                                },
                              ),
                              EditProfileTextField(
                                hintText: 'Type your username',
                                title: 'Username',
                                validate: (String? value) {
                                  if ((value != null && value.isEmpty) ||
                                      value!.contains(' ')) {
                                    return "Username must be not empty and without whitespaces";
                                  }
                                  return null;
                                },
                                textEditingController: _nameController
                                  ..value = _nameController.value
                                      .copyWith(text: user.userName ?? ''),
                                onChanged: (value) {
                                  user.userName = value;
                                  setState(() {});
                                },
                              ),
                              EditProfileTextField(
                                hintText: 'Type your email',
                                title: 'Email',
                                validate: (String? value) {
                                  if (!RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(_emailController.text)) {
                                    return "Email is not valid";
                                  }
                                  return null;
                                },
                                textEditingController: _emailController
                                  ..value = _emailController.value.copyWith(
                                      text: state.profile.email ?? ''),
                                onChanged: (value) {},
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              const EditPasswordWidget(),
                              SizedBox(
                                height: 20.h,
                              ),
                              Divider(
                                thickness: 1,
                                color:
                                    ColorsLimitless.greyLight.withOpacity(0.5),
                              ),
                              SizedBox(
                                height: 20.r,
                              ),
                              Row(
                                children: [
                                  PopUpField(
                                    hintText: state.profile.gender == 0
                                        ? 'Male'
                                        : 'Female',
                                    title: 'Gender',
                                    isSmallSize: true,
                                    gender: (value) {
                                      value != null
                                          ? gender = value
                                          : gender = state.profile.gender!;
                                    },
                                  ),
                                  SizedBox(
                                    width: 14.r,
                                  ),
                                  CalendarTextField(
                                    title: 'Date of Birth',
                                    hintText: '--/--/----',
                                    isSmallSize: true,
                                    select: (value) {
                                      value != null
                                          ? date = value
                                          : date = state.profile.dateOfBirth!;
                                    },
                                    textEditingController: _dateController
                                      ..value = _dateController.value.copyWith(
                                          text: state.profile.dateOfBirth !=
                                                  null
                                              ? DateFormat('dd/MM/yyyy').format(
                                                  DateTime.parse(state
                                                      .profile.dateOfBirth!))
                                              : ''),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 14.r,
                              ),
                              Row(
                                children: [
                                  EditProfileTextField(
                                    hintText: 'kg',
                                    title: 'Weight (kg)',
                                    isSmallSize: true,
                                    textEditingController: _weightController
                                      ..value = _weightController.value
                                          .copyWith(
                                              text: state.profile.weight != null
                                                  ? state.profile.weight
                                                      .toString()
                                                  : ''),
                                    onChanged: (value) {},
                                  ),
                                  SizedBox(
                                    width: 14.r,
                                  ),
                                  EditProfileTextField(
                                    hintText: 'sm',
                                    title: 'Height (sm)',
                                    isSmallSize: true,
                                    textEditingController: _heightController
                                      ..value = _heightController.value
                                          .copyWith(
                                              text: state.profile.height != null
                                                  ? state.profile.height
                                                      .toString()
                                                  : ''),
                                    onChanged: (value) {},
                                  ),
                                ],
                              ),
                              const Expanded(
                                child: SizedBox(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child:
                                    AppButtons().redButton(context, 'Save', () {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  }

                                  BlocProvider.of<ProfileBloc>(context)
                                      .add(ProfileEvent.editUser(
                                          editedUser: EditedUser(
                                    userName: _nameController.text,
                                    dateOfBirth: date.isEmpty
                                        ? state.profile.dateOfBirth
                                        : date,
                                    gender: gender,
                                    firstName: state.profile.firstName,
                                    lastName: state.profile.lastName,
                                    email: _emailController.text,
                                    avatarUrl: state.profile.avatarUrl,
                                    height: int.parse(_heightController.text),
                                    weight: int.parse(_weightController.text),
                                  )));
                                  context.router.pushNamed('/bottom-bar-page');
                                }),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          loading: (state) => const AppLoadingWidget());
    });
  }
}
