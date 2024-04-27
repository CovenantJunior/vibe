import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class VibeMusicTile extends StatefulWidget {
  const VibeMusicTile({super.key});

  @override
  State<VibeMusicTile> createState() => _VibeMusicTileState();
}

class _VibeMusicTileState extends State<VibeMusicTile> {
  final OnAudioQuery audioQuery = OnAudioQuery();

  Future<List<SongModel>> getAllAudioFiles() async {
    // Check and request storage permissions
    if (await Permission.storage.request().isGranted) {
      // Query all audio files on the device
      return await audioQuery.querySongs();
    } else {
      // Return an empty list if permissions are not granted
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
          print(snapshot.data);
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
                return Card(
                  child: ListTile(
                    leading: QueryArtworkWidget(
                      id: song.id,
                      type: ArtworkType.AUDIO,
                      nullArtworkWidget: const Icon(Icons.music_note),
                    ),
                    title: Text(song.title),
                    subtitle: Text(song.artist ?? 'Unknown Artist'),
                    onTap: () {
                      // Handle song selection
                    },
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