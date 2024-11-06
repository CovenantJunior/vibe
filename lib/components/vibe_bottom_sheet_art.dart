import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';
import 'package:vibe/provider/audio_provider.dart';

class VibeBottomSheetArt extends StatelessWidget {
  const VibeBottomSheetArt({super.key});

  @override
  Widget build(BuildContext context) {
    int? id = context.read<AudioProvider>().songIndex;
    return QueryArtworkWidget(
      id: id!,
      format: ArtworkFormat.JPEG,
      type: ArtworkType.AUDIO,
      artworkBorder: BorderRadius.circular(7),
      nullArtworkWidget: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ), // Red border
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
        child: const Icon(
          Icons.music_note_outlined,
          size: 30,
        ),
      ),
    );
  }
}