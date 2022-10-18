import 'package:auto_route/auto_route.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/core/config/router.dart';
import 'package:users_creators/src/features/discover/bloc/search_result/search_result_bloc.dart';
import 'package:users_creators/src/features/discover/bloc/search_result/search_result_event.dart';
import 'package:users_creators/src/features/discover/bloc/search_result/search_result_state.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.r,
      child: TextFormField(
        cursorColor: ColorsLimitless.greyDark,
        onFieldSubmitted: (value) {
        
            SearchResultState.changeName(value);
            if (value[0] == '#') {
              context.read<SearchResultBloc>().add(FindResultHashTagEvent());
              context.router.push(
                  DiscoverResultPageRoute(tag: value, showHashTag: true));
            } else {
              context.read<SearchResultBloc>().add(FindResultNameEvent());
              context.router.push(
                  DiscoverResultPageRoute(tag: value, showHashTag: false));
            }
          
        },
        decoration: InputDecoration(
          floatingLabelStyle: const TextStyle(color: ColorsLimitless.greyDark),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 5.r, top: 12.r, bottom: 12.r),
            child: SvgPicture.asset(
              'assets/icons/discover/search.svg',
              color: ColorsLimitless.greyLight,
            ),
          ),
          filled: true,
          fillColor: const Color.fromRGBO(244, 245, 246, 1),
          labelText: 'Search by creators',
          labelStyle: TextStyle(
              fontFamily: 'SF Pro',
              fontSize: 14.sp,
              color: ColorsLimitless.greyLight,
              fontWeight: FontWeight.w400),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(width: 1, color: Colors.transparent),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(width: 1, color: Colors.transparent),
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              borderSide: BorderSide(
                width: 1,
              )),
        ),
      ),
    );
  }
}
