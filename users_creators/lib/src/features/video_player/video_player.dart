import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoApp extends StatefulWidget {
  VideoApp({Key? key, required this.url}) : super(key: key);
  String url;

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final asd = YoutubePlayer.convertUrlToId(widget.url)!;
    _controller = YoutubePlayerController(
      initialVideoId: asd as String,
      flags: const YoutubePlayerFlags(
        hideControls: false,
        loop: false,
        autoPlay: true,
      ),
    )..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          alignment: Alignment.topLeft,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 90, 0, 30),
              child: SizedBox(
                height: 1.sh,
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: ColorsLimitless.brandColor,
                  progressColors: ProgressBarColors(
                    playedColor: Colors.white,
                    handleColor: Colors.grey[400]!,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50.r, left: 20.r),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  'assets/icons/creator/left_arrow.svg',
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ));
  }
}
