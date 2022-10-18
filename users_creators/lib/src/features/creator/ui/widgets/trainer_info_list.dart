import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../entity/trainer_info_model.dart';

class TrainerInfoList extends StatelessWidget {
  const TrainerInfoList(
      {Key? key,
      required this.certification,
      required this.description,
      required this.experience,
      required this.requirements,
      required this.instagram,
      required this.tikTok,
      required this.youtube,
      required this.specification})
      : super(key: key);
  final String description;
  final String specification;
  final String requirements;
  final String certification;
  final String experience;
  final String? youtube;
  final String? tikTok;
  final String? instagram;

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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'About',
        style: TextStyle(
            fontFamily: 'SF Pro',
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF353945)),
      ),
      SizedBox(
        height: 8.r,
      ),
      Text(
        'A BRIEF INTRO',
        style: TextStyle(
            fontFamily: 'SF Pro',
            fontSize: 9.sp,
            letterSpacing: 1.7,
            color: const Color(
              0xFF777E90,
            ),
            fontWeight: FontWeight.w700),
      ),
      Text(
        description,
        style: TextStyle(
            fontFamily: 'SF Pro',
            height: 1.6,
            letterSpacing: 0.5,
            fontSize: 13.sp,
            color: const Color(
              0xFF777E90,
            ),
            fontWeight: FontWeight.w400),
      ),
      SizedBox(
        height: 10.r,
      ),
      Divider(),
      SizedBox(
        height: 5.r,
      ),
      Text(
        'Specification',
        style: TextStyle(
            fontFamily: 'SF Pro',
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF353945)),
      ),
      SizedBox(
        height: 3.r,
      ),
      Text(
        specification,
        style: TextStyle(
            fontFamily: 'SF Pro',
            height: 1.6,
            letterSpacing: 0.5,
            fontSize: 13.sp,
            color: const Color(
              0xFF777E90,
            ),
            fontWeight: FontWeight.w400),
      ),
      SizedBox(
        height: 10.r,
      ),
      Divider(),
      SizedBox(
        height: 5.r,
      ),
      Text(
        'Experience',
        style: TextStyle(
            fontFamily: 'SF Pro',
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF353945)),
      ),
      SizedBox(
        height: 3.r,
      ),
      Text(
        experience,
        style: TextStyle(
            fontFamily: 'SF Pro',
            height: 1.6,
            letterSpacing: 0.5,
            fontSize: 13.sp,
            color: const Color(
              0xFF777E90,
            ),
            fontWeight: FontWeight.w400),
      ),
      SizedBox(
        height: 10.r,
      ),
      Divider(),
      SizedBox(
        height: 5.r,
      ),
      Text(
        'Requirements',
        style: TextStyle(
            fontFamily: 'SF Pro',
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF353945)),
      ),
      SizedBox(
        height: 3.r,
      ),
      Text(
        requirements,
        style: TextStyle(
            fontFamily: 'SF Pro',
            height: 1.6,
            letterSpacing: 0.5,
            fontSize: 13.sp,
            color: const Color(
              0xFF777E90,
            ),
            fontWeight: FontWeight.w400),
      ),
      SizedBox(
        height: 10.r,
      ),
      Divider(),
      SizedBox(
        height: 5.r,
      ),
    
          Text(
              'Social Media',
              style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF353945)),
            ),
          
      SizedBox(
        height: 3.r,
      ),
      Text(
        'Follow me on Instagram and remember to tag me in your pictures',
        style: TextStyle(
            fontFamily: 'SF Pro',
            height: 1.6,
            letterSpacing: 0.5,
            fontSize: 13.sp,
            color: const Color(
              0xFF777E90,
            ),
            fontWeight: FontWeight.w400),
      ),
      Padding(
        padding: EdgeInsets.only(top: 10.r),
        child: Row(
          children: [
            instagram == null ? SizedBox() :
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(9.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(color: const Color(0xFFE6E8EC))),
                child: SvgPicture.asset(
                  'assets/icons/creator/instagram.svg',
                  height: 20.r,
                ),
              ),
              onTap: (){
                    openInstagram(Uri.parse(instagram!));
              },
            ),
            SizedBox(
              width:instagram == null ? 0.r :  9.r,
            ),
              tikTok == null ? SizedBox() :
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(9.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(color: const Color(0xFFE6E8EC))),
                child: SvgPicture.asset(
                  'assets/icons/creator/tik_tok.svg',
                  height: 20.r,
                ),
              ),
              onTap: (){
                    openTikTok(Uri.parse(tikTok!));
              },
            ),
            SizedBox(
              width: tikTok == null ? 0.r : 9.r,
            ),
              youtube == null ? const SizedBox() :
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(9.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(color: const Color(0xFFE6E8EC))),
                child: SvgPicture.asset(
                  'assets/icons/creator/youtube.svg',
                  height: 20.r,
                ),
              ),
              onTap: (){
                openYoutube(Uri.parse(youtube!));
              },
            )
          ],
        ),
      ),
      SizedBox(
        height: 10.r,
      ),
      Divider(),
      SizedBox(
        height: 5.r,
      ),
      Text(
        'Certification',
        style: TextStyle(
            fontFamily: 'SF Pro',
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF353945)),
      ),
      SizedBox(
        height: 3.r,
      ),
      Text(
        certification,
        style: TextStyle(
            fontFamily: 'SF Pro',
            height: 1.6,
            letterSpacing: 0.5,
            fontSize: 13.sp,
            color: const Color(
              0xFF777E90,
            ),
            fontWeight: FontWeight.w400),
      ),
    ]);
  }
}
