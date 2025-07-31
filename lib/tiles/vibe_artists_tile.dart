import 'package:flutter/material.dart';
import 'package:vibe/components/skins.dart';

class VibeArtistsTile extends StatefulWidget {
  const VibeArtistsTile({super.key});

  @override
  State<VibeArtistsTile> createState() => _VibeArtistsTileState();
}

class _VibeArtistsTileState extends State<VibeArtistsTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: coolGradients[0],
        ),
      ),
    );
  }
}
