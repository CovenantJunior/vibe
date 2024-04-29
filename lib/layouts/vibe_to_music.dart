import 'package:flutter/material.dart';
import 'package:on_audio_query_platform_interface/src/models/song_model.dart';
import 'package:vibe/components/vibe_cover.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VibeCover(
            child: Icon(Icons.music_note_outlined)
          ),
          Center(
            child: Text(
              widget.song.title,
              style: const TextStyle(
                fontFamily: 'Futura'
              ),
            )
          ),
        ],
      ),
    );
  }
}