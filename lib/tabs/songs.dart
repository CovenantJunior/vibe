import 'package:flutter/material.dart';
import 'package:vibe/tiles/vibe_songs_tile.dart';

class Songs extends StatefulWidget {
  const Songs({super.key});

  @override
  State<Songs> createState() => _SongsState();
}

class _SongsState extends State<Songs> {
  @override
  Widget build(BuildContext context) {
    return const VibeSongsTile();
  }
}