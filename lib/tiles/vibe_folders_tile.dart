import 'package:flutter/material.dart';
import 'package:vibe/skins.dart';

class VibeFoldersTile extends StatefulWidget {
  const VibeFoldersTile({super.key});

  @override
  State<VibeFoldersTile> createState() => _VibeFoldersTileState();
}

class _VibeFoldersTileState extends State<VibeFoldersTile> {
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
