import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/create_session/entity/history_exercise.dart';

class HistoryExerciseList extends StatefulWidget {
  HistoryExerciseList({Key? key, required this.index}) : super(key: key);
  int index;

  @override
  _HistoryExerciseListState createState() => _HistoryExerciseListState();
}

class _HistoryExerciseListState extends State<HistoryExerciseList> {
  List _done = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 8.r,),
          Text('${historyExerciseList[widget.index].number}'),
          SizedBox(width: 28.r,),
          Container(
            width: 115.r,
            height: 30.r,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r), color: Colors.white),
            child: Center(
              child: Text(
                '${historyExerciseList[widget.index].reps}',
                style: TextStyle(
                    fontFamily: "SF Pro",
                    fontSize: 12.sp,
                    color: ColorsLimitless.greyLight,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(width: 15.r,),
        
          Container(
            width: 115.r,
            height: 30.r,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r), color: Colors.white),
            child: Center(
              child: Text(
                '${historyExerciseList[widget.index].reps}',
                style: TextStyle(
                    fontFamily: "SF Pro",
                    fontSize: 12.sp,
                    color: ColorsLimitless.textColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
            SizedBox(width: 18.r,),
          _done.contains(widget.index)
              ? Expanded(
                  child: GestureDetector(
                  child: SvgPicture.asset(
                      'assets/icons/create_session/done_circle.svg',
                      height: 23.r,
                      ),
                  onTap: () {
                    _done.remove(widget.index);
                    setState(() {});
                  },
                ))
              : Expanded(
                  child: GestureDetector(
                    child: SvgPicture.asset(
                        'assets/icons/create_session/not_done.svg',
                      height: 20.r,),
                    onTap: () {
                      _done.add(widget.index);
                      setState(() {});
                    },
                  ),
                )
        ],
      ),
    );
  }
}
