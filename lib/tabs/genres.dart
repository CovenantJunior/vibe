import 'package:flutter/material.dart';
import 'package:vibe/tiles/vibe_genres_tile.dart';

class Genres extends StatefulWidget {
  const Genres({super.key});

  @override
  State<Genres> createState() => _GenresState();
}

class _GenresState extends State<Genres> {
  @override
  Widget build(BuildContext context) {
    return const VibeGenresTile();
  }
}