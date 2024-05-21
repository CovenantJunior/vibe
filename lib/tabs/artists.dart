import 'package:flutter/material.dart';
import 'package:vibe/tiles/vibe_artists_tile.dart';

class Artists extends StatefulWidget {
  const Artists({super.key});

  @override
  State<Artists> createState() => _ArtistsState();
}

class _ArtistsState extends State<Artists> {
  @override
  Widget build(BuildContext context) {
    return const VibeArtistsTile();
  }
}