import 'package:flutter/foundation.dart';

class SongInfo {
  final String artist;
  final String title;

  SongInfo({@required this.artist, @required this.title});

  factory SongInfo.fromJson(Map<String, dynamic> jsonObject) {
    var songHistoryList = jsonObject['SongHistoryList'];
    if (songHistoryList == null) {
      return SongInfo(artist: '-', title: '-');
    }

    var currentSong = songHistoryList[0];
    if (currentSong == null) {
      return SongInfo(artist: '-', title: '-');
    }

    return SongInfo(
        artist: currentSong['Artist'] ?? '-',
        title: currentSong['Title'] ?? '-');
  }
}
