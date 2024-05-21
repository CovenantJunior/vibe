import 'package:flutter/material.dart';
import 'package:vibe/theme_skins/skins.dart';

class VibeSpotifyTile extends StatefulWidget {
  const VibeSpotifyTile({super.key});

  @override
  State<VibeSpotifyTile> createState() => _VibeSpotifyTileState();
}

class _VibeSpotifyTileState extends State<VibeSpotifyTile> {
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
