import 'package:flutter/material.dart';
import 'package:vibe/components/skins.dart';

class VibePlaylistsTile extends StatefulWidget {
  const VibePlaylistsTile({super.key});

  @override
  State<VibePlaylistsTile> createState() => _VibePlaylistsTileState();
}

class _VibePlaylistsTileState extends State<VibePlaylistsTile> {
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
