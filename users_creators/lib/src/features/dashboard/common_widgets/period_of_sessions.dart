import 'package:components/common_widgets/progress.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/dashboard/bloc/get_session_range/get_session_range_bloc.dart';
import 'package:users_creators/src/features/dashboard/bloc/get_session_range/get_session_range_event.dart';
import 'package:users_creators/src/features/dashboard/bloc/get_session_range/get_session_range_state.dart';

class PeriodOfSessions extends StatelessWidget {
  const PeriodOfSessions({Key? key, required this.range}) : super(key: key);

  final int firstTenDays = 0;
  final int lastThirtyDays = 1;
  final int thisYear = 2;
  final int lastYear = 3;
  final int beforeLastYear = 4;
  final int allTime = 5;

  final GotSessionRangeState range;

  void _choosePeriod(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        message: const Text('Select Date Range'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: () {
              context.read<GetSessionRangeBloc>().add(UpdateSessionRangeEvent(
                  requestDate: 'Last 10 sessions', requestRange: firstTenDays));
              Navigator.pop(context);
              GetSessionRangeEvent.lastRequestRange = firstTenDays;
              GetSessionRangeEvent.lastRequestDate = 'Last 10 Sessions';
            },
            child: const Text('Last 10 Sessions'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              context.read<GetSessionRangeBloc>().add(UpdateSessionRangeEvent(
                  requestDate: 'Last 30 Days', requestRange: lastThirtyDays));

              Navigator.pop(context);
              GetSessionRangeEvent.lastRequestRange = lastThirtyDays;
              GetSessionRangeEvent.lastRequestDate = 'Last 30 Days';
            },
            child: const Text('Last 30 Days'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              context.read<GetSessionRangeBloc>().add(UpdateSessionRangeEvent(
                  requestDate: '${DateTime.now().year}',
                  requestRange: thisYear));
              Navigator.pop(context);
              GetSessionRangeEvent.lastRequestRange = thisYear;
              GetSessionRangeEvent.lastRequestDate = '${DateTime.now().year}';
            },
            child: Text('${DateTime.now().year}'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              context.read<GetSessionRangeBloc>().add(UpdateSessionRangeEvent(
                  requestDate: '${DateTime.now().year - 1}',
                  requestRange: lastYear));
              Navigator.pop(context);
              GetSessionRangeEvent.lastRequestRange = lastYear;
              GetSessionRangeEvent.lastRequestDate =
                  '${DateTime.now().year - 1}';
            },
            child: Text('${DateTime.now().year - 1}'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              context.read<GetSessionRangeBloc>().add(UpdateSessionRangeEvent(
                  requestDate: '${DateTime.now().year - 2}',
                  requestRange: beforeLastYear));
              Navigator.pop(context);
              GetSessionRangeEvent.lastRequestRange = beforeLastYear;
              GetSessionRangeEvent.lastRequestDate =
                  '${DateTime.now().year - 2}';
            },
            child: Text('${DateTime.now().year - 2}'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              context.read<GetSessionRangeBloc>().add(UpdateSessionRangeEvent(
                  requestDate: 'All time', requestRange: allTime));
              Navigator.pop(context);
              GetSessionRangeEvent.lastRequestRange = allTime;
              GetSessionRangeEvent.lastRequestDate = 'All Time';
            },
            child: const Text('All Time'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel')),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 21.r, vertical: 15.r),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: Text(
                range.range,
                style: TextStyle(
                    fontFamily: "SF Pro",
                    fontSize: 13.sp,
                    letterSpacing: 0.5,
                    color: ColorsLimitless.textColor,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SvgPicture.asset('assets/icons/dashboard/icon_down.svg'),
          ],
        ),
      ),
      onTap: () {
        _choosePeriod(context);
      },
    );
  }
}
