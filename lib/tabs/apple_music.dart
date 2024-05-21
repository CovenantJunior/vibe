import 'package:flutter/material.dart';
import 'package:vibe/tiles/vibe_album_apple_music_tile.dart';

class AppleMusic extends StatefulWidget {
  const AppleMusic({super.key});

  @override
  State<AppleMusic> createState() => _AppleMusicState();
}

class _AppleMusicState extends State<AppleMusic> {
  @override
  Widget build(BuildContext context) {
    return const VibeAppleMusicTile();
  }
}