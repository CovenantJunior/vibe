import 'package:flutter/material.dart';
import 'package:vibe/tiles/vibe_folders_tile.dart';

class Folders extends StatefulWidget {
  const Folders({super.key});

  @override
  State<Folders> createState() => _FoldersState();
}

class _FoldersState extends State<Folders> {
  @override
  Widget build(BuildContext context) {
    return const VibeFoldersTile();
  }
}