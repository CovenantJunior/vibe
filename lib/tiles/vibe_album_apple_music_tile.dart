import 'package:flutter/material.dart';
import 'package:vibe/theme_skins/skins.dart';

class VibeAppleMusicTile extends StatefulWidget {
  const VibeAppleMusicTile({super.key});

  @override
  State<VibeAppleMusicTile> createState() => _VibeAppleMusicTileState();
}

class _VibeAppleMusicTileState extends State<VibeAppleMusicTile> {
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