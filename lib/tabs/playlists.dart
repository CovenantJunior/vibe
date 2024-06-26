import 'package:flutter/material.dart';
import 'package:vibe/tiles/vibe_playlists_tile.dart';

class Playlists extends StatefulWidget {
  const Playlists({super.key});

  @override
  State<Playlists> createState() => _PlaylistsState();
}

class _PlaylistsState extends State<Playlists> {
  @override
  Widget build(BuildContext context) {
    return const VibePlaylistsTile();
  }
}