import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

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
    return const Scaffold();
  }
}