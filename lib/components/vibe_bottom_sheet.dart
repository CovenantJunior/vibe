import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:vibe/provider/audio_provider.dart';
import 'package:vibe/components/skins.dart';

class VibeBottomSheet extends StatefulWidget {
  const VibeBottomSheet({super.key});

  @override
  State<VibeBottomSheet> createState() => _VibeBottomSheetState();
}

class _VibeBottomSheetState extends State<VibeBottomSheet> with SingleTickerProviderStateMixin {
  late AnimationController _playChart;
  void update() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _playChart = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5)
    );
    // _playChart.repeat();
  }

  @override
  Widget build(BuildContext context) {
    var audioProvider = context.watch<AudioProvider>();
    audioProvider.isPlaying ? _playChart.repeat() : _playChart.reset();
    return Container(
      height: 70,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: coolGradients[0],
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30)
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            dense: true,
            leading: Lottie.asset(
              "assets/animations/1715719604390.json",
              controller: _playChart,
              repeat: true,
            ),
            title: Text(
              audioProvider.songTitle!,
              style: const TextStyle(
                fontFamily: 'SpotifyMix'
              ),
            ),
            subtitle: Text(
              audioProvider.songArtist!,
              style: const TextStyle(
                fontFamily: 'SpotifyMix'
              ),
            ),
            trailing:
            audioProvider.isPlaying == true ? IconButton(
              onPressed: (){
                audioProvider.pauseMusic(audioProvider.songUri);
              },
              icon: const Icon(
                Icons.pause_outlined,
                size: 30,
              )
            ) : IconButton(
              onPressed: (){
                if (audioProvider.resume) {
                  audioProvider.resumeMusic();
                  audioProvider.isPlaying = true;
                } else {
                  // Play if it isn't a resumption
                  audioProvider.playMusic(audioProvider.songIndex, audioProvider.songUri, audioProvider.totalDuration.inMilliseconds, update);
                  audioProvider.isPlaying = true;
                }
              },
              icon: const Icon(
                Icons.play_arrow_outlined,
                size: 30,
              )
            ),
          ),
          LinearProgressIndicator(
            value: mounted ? (audioProvider.currentDuration.inMilliseconds / audioProvider.totalDuration.inMilliseconds) : 0,
            color: Colors.yellow,
          )
        ],
      ),
    );
  }
}