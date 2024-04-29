import 'package:flutter/material.dart';
import 'package:on_audio_query_platform_interface/src/models/song_model.dart';

class VibeToMusic extends StatefulWidget {
  final SongModel song;
  const VibeToMusic({
      super.key,
      required this.song
  });

  @override
  State<VibeToMusic> createState() => _VibeToMusicState();
}

class _VibeToMusicState extends State<VibeToMusic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Center(
        child: Text(
          widget.song.title,
          style: const TextStyle(
            fontFamily: 'Futura'
          ),
        )
      ),
    );
  }
}