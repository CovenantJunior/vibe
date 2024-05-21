import 'package:flutter/material.dart';
import 'package:vibe/tiles/vibe_album_tile.dart';

class Albums extends StatefulWidget {
  const Albums({super.key});

  @override
  State<Albums> createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {
  @override
  Widget build(BuildContext context) {
    return const VibeAlbumTile();
  }
}