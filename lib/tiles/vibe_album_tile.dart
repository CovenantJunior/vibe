import 'package:flutter/material.dart';
import 'package:vibe/components/skins.dart';

class VibeAlbumTile extends StatefulWidget {
  const VibeAlbumTile({super.key});

  @override
  State<VibeAlbumTile> createState() => _VibeAlbumTileState();
}

class _VibeAlbumTileState extends State<VibeAlbumTile> {
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