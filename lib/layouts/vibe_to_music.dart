import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
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
            child: QueryArtworkWidget(
              id: widget.song.id,
              type: ArtworkType.AUDIO,
              quality: 100,
              artworkHeight: 200,
              artworkWidth: 200,
            )
          ),
          const SizedBox(height: 20),
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