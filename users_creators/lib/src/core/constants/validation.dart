import 'package:youtube_player_flutter/youtube_player_flutter.dart';

const passwordValidation =
    r"^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$";
const emailValidation =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

String youtubeImage(String link) {
  return 'https://img.youtube.com/vi/${YoutubePlayer.convertUrlToId(link)}/0.jpg';
}
