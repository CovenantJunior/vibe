import 'package:flutter/material.dart';
import 'package:vibe/tiles/vibe_spotify_tile.dart';

class Spotify extends StatefulWidget {
  const Spotify({super.key});

  @override
  State<Spotify> createState() => _SpotifyState();
}

class _SpotifyState extends State<Spotify> {
  @override
  Widget build(BuildContext context) {
    return const VibeSpotifyTile();
  }
}