import 'package:flutter/material.dart';
import 'package:vibe/skins.dart';

class VibeGenresTile extends StatefulWidget {
  const VibeGenresTile({super.key});

  @override
  State<VibeGenresTile> createState() => _VibeGenresTileState();
}

class _VibeGenresTileState extends State<VibeGenresTile> {
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
