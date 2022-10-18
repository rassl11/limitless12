import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TagList extends StatefulWidget {
  TagList(
      {Key? key,
      required this.tag,
      required this.index,
      required this.onTap,
      required this.pressed})
      : super(key: key);
  int index;
  String tag;
  final Function onTap;
  final List<String> pressed;

  @override
  State<TagList> createState() => _TagListState();
}

class _TagListState extends State<TagList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: widget.pressed.contains(widget.tag)
              ? const Color(0xFFE94359)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
              color: widget.pressed.contains(widget.tag)
                  ? Colors.transparent
                  : const Color(0xFF777E90)),
        ),
        child: Text(
          '#${widget.tag}',
          style: TextStyle(
              fontFamily: "SF Pro",
              letterSpacing: 0.5,
              fontSize: 13.sp,
              color: widget.pressed.contains(widget.tag)
                  ? Colors.white
                  : const Color(0xFF777E90),
              fontWeight: FontWeight.w500),
        ),
      ),
      onTap: () {
        widget.onTap();
        if (widget.pressed.contains(widget.tag)) {
          widget.pressed.removeWhere((element) => element == widget.tag);
        } else {
          widget.pressed.add(widget.tag);
        }
        setState(() {});
      },
    );
  }
}
