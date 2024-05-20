import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:vibe/provider/audio_provider.dart';

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
    return ListTile(
      dense: true,
      leading: Lottie.asset(
        "assets/animations/1715719604390.json",
        controller: _playChart,
        repeat: true,
        height: 40,
        width: 40
      ),
      title: Text(
        audioProvider.songTitle!,
        style: const TextStyle(
          fontFamily: 'Futura'
        ),
      ),
      subtitle: const Text(
        'Unknown Artist',
        style: TextStyle(
          fontFamily: 'Futura'
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
          color: Color.fromARGB(255, 202, 202, 123),
        )
      ) : IconButton(
        onPressed: (){
          audioProvider.resumeMusic();
          audioProvider.isPlaying = true;
        },
        icon: const Icon(
          Icons.play_arrow_outlined,
          size: 30,
          color: Color.fromARGB(255, 202, 202, 123),
        )
      ),
    );
  }
}