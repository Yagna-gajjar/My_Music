import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_music/utils/app_colors.dart';

class CurrentSong extends StatefulWidget {
  const CurrentSong({super.key});

  @override
  State<CurrentSong> createState() => _CurrentSongState();
}

class _CurrentSongState extends State<CurrentSong> {
  bool isPlaying = false;
  late final AudioPlayer player;
  late final AssetSource path;

  Duration _duration = const Duration();
  Duration _posiion = const Duration();

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Future initPlayer() async {
    player = AudioPlayer();
    path = AssetSource('goldenhour.mp3');

    player.onDurationChanged.listen((Duration d) {
      setState(() {
        _duration = d;
      });
    });

    player.onPositionChanged.listen((Duration p) {
      setState(() {
        _posiion = p;
      });
    });

    player.onPlayerComplete.listen((event) {
      setState(() {
        _posiion = _duration;
      });
    });
  }

  void playerPaused() async {
    if (isPlaying) {
      player.pause();
      isPlaying = false;
    } else {
      player.play(path);
      isPlaying = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Image.network(
                      "https://upload.wikimedia.org/wikipedia/en/4/43/JVKE_-_Golden_Hour.png")),
              Text(
                "Golden Hours",
                style: GoogleFonts.varelaRound(color: AppColors.primaryColor),
              ),
            ],
          ),
          Slider(
            value: _posiion.inSeconds.toDouble(),
            onChanged: (value) async {
              await player.seek(Duration(seconds: value.toInt()));
            },
            min: 0,
            max: _duration.inSeconds.toDouble(),
            inactiveColor: Colors.grey,
            activeColor: AppColors.primaryColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(_duration.toString().split('.').first ?? ''),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  player.seek(Duration(seconds: _posiion.inSeconds - 10));
                },
                child: Image.asset('assets/reverse_10.png'),
              ),InkWell(
                onTap: () {
                  player.seek(Duration(seconds: _posiion.inSeconds - 10));
                },
                child: Image.asset('assets/forward_10.png'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
