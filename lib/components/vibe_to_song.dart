import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:vibe/components/vibe_cover.dart';

class VibeToSong extends StatefulWidget {
  final SongModel song;
  const VibeToSong({
      super.key,
      required this.song
  });


  @override
  State<VibeToSong> createState() => _VibeToSongState();
}

class _VibeToSongState extends State<VibeToSong> {
  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VibeCover(
              child: QueryArtworkWidget(
                id: widget.song.id,
                type: ArtworkType.AUDIO,
                quality: 100,
                artworkHeight: 250,
                artworkWidth: 250,
              )
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                widget.song.title,
                style: const TextStyle(
                  fontFamily: 'Futura',
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              )
            ),
            Center(
              child: Text(
                widget.song.artist!,
                style: const TextStyle(
                  fontFamily: 'Futura',
                  fontWeight: FontWeight.w400
                ),
              )
            ),
            const SizedBox(height: 50),
          ],
        );
  }
}