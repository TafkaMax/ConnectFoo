import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider_demo/models/song_info.dart';

class SongInfoScreen extends StatefulWidget {
  @override
  _SongInfoScreenState createState() => _SongInfoScreenState();
}

class _SongInfoScreenState extends State<SongInfoScreen> {
  Future<SongInfo> songInfo;
  Timer _timer;
  int _timerCounter = 10;

  @override
  void initState() {
    super.initState();
    songInfo = fetchSongInfo();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);

    _timer = Timer.periodic(oneSec, (timer) {
      if (mounted) {
        setState(() {
          if (_timerCounter <= 0) {
            songInfo = fetchSongInfo();
            _timerCounter = 10;
          } else {
            _timerCounter--;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo for fetch'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Return to counter'),
              ),
              FutureBuilder<SongInfo>(
                future: songInfo,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                        snapshot.data.artist + ' - ' + snapshot.data.title);
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error);
                  }
                  return CircularProgressIndicator();
                },
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    songInfo = fetchSongInfo();
                  });
                },
                child: Text('Refresh data'),
              ),
              ElevatedButton(
                onPressed: () {
                  _timerCounter = 10;
                  startTimer();
                },
                child: Text('Refresh after $_timerCounter seconds'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<SongInfo> fetchSongInfo() async {
  final response = await http.get('https://dad.akaver.com/api/SongTitles/RRAP');
  if (response.statusCode == 200) {
    return SongInfo.fromJson(json.decode(response.body));
  }
  return SongInfo(
      artist: "Status: $response.statusCode", title: response.reasonPhrase);
}
