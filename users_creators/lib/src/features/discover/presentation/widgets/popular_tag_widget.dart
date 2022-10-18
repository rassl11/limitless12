import 'package:components/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/discover/bloc/discover_bloc.dart';
import 'package:users_creators/src/features/discover/presentation/widgets/coach_card.dart';

class PopularTagWidget extends StatelessWidget {
  final int index;
  final CardSize size;

  const PopularTagWidget({Key? key, required this.index, required this.size})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverBloc, DiscoverState>(builder: (context, state) {
      return state.map(initial: ((value) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.r,
            ),
            Padding(
              padding: EdgeInsets.only(left: 13.r),
              child: Text(
                '#${value.tags[index].tagName}'.toUpperCase(),
                style: TextStyle(
                    color: ColorsLimitless.greyMedium,
                    letterSpacing: 0.5,
                    fontFamily: 'SF Pro',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: size == CardSize.small ? 150.r : 240.r,
              child: ListView.builder(
                  padding: EdgeInsets.only(left: 13.r),
                  scrollDirection: Axis.horizontal,
                  itemCount: value.tags[index].creators!.length,
                  itemBuilder: (context, i) {
                    return CoachCard(
                      title: value.tags[index].creators![i].title,
                      size: size,
                      id: value.tags[index].creators![i].id!,
                      image: 
                      value.tags[index].creators![i].avatarUrl,
                      name:
                          "${value.tags[index].creators![i].firstName!} ${value.tags[index].creators![i].lastName!}",
                    );
                  }),
            ),
          ],
        );
      }), loading: (val) {
        return const Offstage();
      });
    });
  }
}
