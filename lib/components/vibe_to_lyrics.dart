import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:vibe/skins.dart';

class VibeToLyrics extends StatefulWidget {
  final SongModel song;
  const VibeToLyrics({
      super.key,
      required this.song
  });

  @override
  State<VibeToLyrics> createState() => _VibeToLyricsState();
}

class _VibeToLyricsState extends State<VibeToLyrics> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: coolGradients[8],
          ),
      ),
    );
  }
}