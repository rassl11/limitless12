import 'package:auto_route/auto_route.dart';
import 'package:components/buttons/app_buttons.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AuthorizationOnboarding extends StatelessWidget {
  const AuthorizationOnboarding({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/auth_page/fitness_man.png',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    stops: const [
                      0.1,
                      0.7,
                    ],
                    begin: Alignment.center,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color.fromARGB(255, 27, 16, 16).withOpacity(0.2),
                      Color.fromARGB(255, 23, 4, 4).withOpacity(0.95),
                    ])),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 15.r, right: 15.r),
              child: Align(
                alignment: const FractionalOffset(0, 0.95),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   SvgPicture.asset('assets/icons/welcome_page/logo.svg'),
                    SizedBox(
                      height: 5.r,
                    ),
                    //TEXT
                    motto(),
                    SizedBox(
                      height: 20.r,
                    ),
                    AppButtons().redButton(context, 'Create new Account', (){
                      context.router.navigateNamed('/welcome-page');
                    }),
                    
                    SizedBox(
                      height: 18.r,
                    ),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                                fontFamily: 'SF Pro',
                                fontSize: 13.sp,
                                color: Color(0xFFB1B5C3)),
                          ),
                          AppButtons().onboardingButton('Login', (){
                            context.router.navigateNamed('/user-login');
                          }, ColorsLimitless.brandColor)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget motto() {
  return Text(
    '''
CREATE.
INSIRE.
MONETIZE.''',
    style: TextStyle(
        fontSize: 30.sp,
        color: Colors.white,
        fontFamily: "SF Pro",
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic),
  );
}
