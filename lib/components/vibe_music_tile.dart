import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vibe/layouts/vibe_to_music.dart';

class VibeMusicTile extends StatefulWidget {
  const VibeMusicTile({super.key});

  @override
  State<VibeMusicTile> createState() => _VibeMusicTileState();
}

class _VibeMusicTileState extends State<VibeMusicTile> {
  final OnAudioQuery audioQuery = OnAudioQuery();

  Future<List<SongModel>> getAllAudioFiles() async {
    if (await Permission.storage.request().isGranted) {
      return await audioQuery.querySongs(
        sortType: SongSortType.TITLE,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        ignoreCase: true,
      );
    } else {
      return [];
    }
  }

  // List of audio files
  late Future<List<SongModel>> _audioFilesFuture;

  @override
  void initState() {
    super.initState();
    // Get all audio files on the device
    _audioFilesFuture = getAllAudioFiles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<SongModel>>(
        future: _audioFilesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No music files found'));
          } else {
            List<SongModel> audioFiles = snapshot.data!;
            return ListView.builder(
              itemCount: audioFiles.length,
              itemBuilder: (context, index) {
                SongModel song = audioFiles[index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Container(
                    child: ListTile(
                      dense: true,
                      leading: QueryArtworkWidget(
                        artworkWidth: 30,
                        artworkHeight: 30,
                        id: song.id,
                        quality: 100,
                        artworkQuality: FilterQuality.high,
                        type: ArtworkType.AUDIO,
                        nullArtworkWidget: const Icon(
                          Icons.music_note_outlined,
                          size: 30,
                        ),
                      ),
                      title: Text(
                        song.title,
                        style: const TextStyle(
                          fontFamily: 'Futura'
                        ),
                      ),
                      subtitle: Text(
                        song.artist ?? 'Unknown Artist',
                        style: const TextStyle(
                          fontFamily: 'Futura'
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const VibeToMusic()));
                      },
                    ).animate().fadeIn().scale(
                      duration: const Duration(milliseconds: 300)
                    )
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}