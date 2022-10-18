import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/creator/bloc/creator/creator_bloc.dart';
import 'package:users_creators/src/features/creator/bloc/creator/creator_state.dart';
import 'package:users_creators/src/features/creator/ui/widgets/show_about_popup.dart';
import '../../bloc/dropdown/user_drop_down_bloc.dart';
import '../../bloc/dropdown/user_drop_down_event.dart';
import '../../bloc/subscribe/user_subscribe_state.dart';


class AboutPopup extends StatelessWidget {
  const AboutPopup({Key? key, required this.stateSub,

  }) : super(key: key);
  final UserSubscribeState stateSub;


  

  @override
  Widget build(BuildContext context) {
  
    return BlocBuilder<CreatorProfileBloc, CreatorProfileState>(
      builder: (context, stateCreator) {
        if(stateCreator is LoadedCreatorProfileState){
        return 
        Positioned(
            top:  180.r,
            right: 13.r,
            child: Container(
              width: 150.r,
              height: 50.r,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: const Color(0xFF475459).withOpacity(0.1),
                    offset: const Offset(4, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(4.sp),
                border: Border.all(color: Color(0xFFE6E8EC)),
                color: Colors.white,
              ),
              child: GestureDetector(
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/icons/creator/about.svg'),
                    SizedBox(width: 10.r,),
                      Text('About creator',
                        
                        style: TextStyle(
                            color: Color(0xFF353945),
                            fontFamily: 'SF Pro',
                            fontSize: 14.sp,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  context.read<UserDropDownBloc>().add(UserCloseAboutEvent());
                  ShowAboutPopup.openAboutBottomSheet(
                    tags: stateCreator.tags ?? [],
                    instagram: stateCreator.data.instagram ,
                    tikTok:  stateCreator.data.tikTok ,
                    youtube: stateCreator.data.youtube,
                    context: context,
                    image: stateCreator.data.avatarUrl ?? "",
                    lastName: stateCreator.data.lastName ?? "Empty",
                    experience: stateCreator.data.experience?? "Empty",
                    specification: stateCreator.data.specification ?? "Empty",
                    certification: stateCreator.data.specification ?? "Empty",
                    requirements: stateCreator.data.requirements ?? "Empty",
                    description: stateCreator.data.description ?? "Empty",
                    name: stateCreator.data.firstName ?? "Empty"


                  );
                },
              ),
            ));
      } return SizedBox.shrink();
      },
    );
  }
  
}

