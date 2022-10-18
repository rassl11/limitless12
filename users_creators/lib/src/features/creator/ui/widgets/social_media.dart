import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../bloc/subscribe/user_subscribe_bloc.dart';
import '../../bloc/subscribe/user_subscribe_state.dart';

class SocialMediaPopup extends StatelessWidget {
  const SocialMediaPopup(
      {Key? key,
      required this.bloc,
      required this.stateSub,
      required this.instagram,
      required this.tikTok,
      required this.youtube})
      : super(key: key);

  final UserSubscribeBloc bloc;
  final UserSubscribeState stateSub;
  final String? instagram;
  final String? tikTok;
  final String? youtube;

  Future openYoutube(Uri url) async{
    if(await canLaunchUrl(url)){
      await launchUrl(url);
    }
    else{
      await launchUrl(Uri.parse('https://youtube.com'));
    }
  }
    Future openInstagram(Uri url) async{
    if(await canLaunchUrl(url)){
      await launchUrl(url);
    }
    else{
      await launchUrl(Uri.parse('https://instagram.com'));
    }
  }

  Future openTikTok(Uri url) async{
    if(await canLaunchUrl(url)){
      await launchUrl(url);
    }
    else{
      await launchUrl(Uri.parse('https://tiktok.com'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 180.r ,
        right: 13.r,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 15.r),
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
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                instagram != null ?
                GestureDetector(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                          'assets/icons/creator/instagram_popup.svg'),
                      SizedBox(width: 10.r),
                      Text(
                        'Instagram',
                        style: TextStyle(
                            color: Color(0xFF353945),
                            fontFamily: 'SF Pro',
                            fontSize: 14.sp,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  onTap: (){
                      openInstagram(Uri.parse(instagram!));
                  },
                ) 
                : SizedBox(),
                
                SizedBox(
                  height:   instagram != null ? 20.r : 0.r
                ),
                  tikTok != null ?
                GestureDetector(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/icons/creator/tik_tok.svg'),
                      SizedBox(width: 10.r),
                      Text(
                        'Tik Tok',
                        style: TextStyle(
                            color: Color(0xFF353945),
                            fontFamily: 'SF Pro',
                            fontSize: 14.sp,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  onTap: () {
                      openTikTok(Uri.parse(tikTok!));
                  },
                ) : SizedBox(),
                SizedBox(
                  height:youtube != null ? 20.r : 0.r
                ),
                youtube != null ?
                GestureDetector(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/icons/creator/youtube.svg'),
                      SizedBox(width: 10.r),
                      Text(
                        'Youtube',
                        style: TextStyle(
                            color: Color(0xFF353945),
                            fontFamily: 'SF Pro',
                            fontSize: 14.sp,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  onTap: () {
                    openYoutube(Uri.parse(youtube!));
                  },
                ) : SizedBox()
              ],
            ),
          ),
        ));
  }
}
