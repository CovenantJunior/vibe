import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:vibe/layouts/vibe_to_music.dart';
import 'package:vibe/provider/audio_provider.dart';

class VibeMusicTile extends StatefulWidget {
  const VibeMusicTile({super.key});

  @override
  State<VibeMusicTile> createState() => _VibeMusicTileState();
}

class _VibeMusicTileState extends State<VibeMusicTile> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin  {

  late AnimationController _playChart;
  late Duration playDuration;

  final OnAudioQuery audioQuery = OnAudioQuery();
  Future<List<SongModel>> getAllAudioFiles() async {
    if (await Permission.storage.request().isGranted) {
      return await audioQuery.querySongs(
        sortType: SongSortType.TITLE,
        orderType: OrderType.ASC_OR_SMALLER,
        ignoreCase: true,
        uriType: UriType.EXTERNAL
      );
    } else {
      return [];
    }
  }

  // List of audio files
  late Future<List<SongModel>> _audioFilesFuture;

  void refresh () {
    
    setState(() {
      _audioFilesFuture = getAllAudioFiles();
    });
  }

  void update() {
      setState(() {
        
      });
    }

  @override
  void initState() {
    super.initState();
    // Get all audio files on the device
    _audioFilesFuture = getAllAudioFiles();
    _playChart = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2)
    );
    _playChart.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _playChart.dispose();
  }

  Future<void> refreshAudioFiles() async {
    // Fetch new data
    _audioFilesFuture = getAllAudioFiles();

    // Once the refresh operation is complete, update the state to rebuild the widget
    setState(() {
      // The state is updated to reflect the new data
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required when using AutomaticKeepAliveClientMixin
    _playChart.loop();
    var audioProvider = context.watch<AudioProvider>();
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => refreshAudioFiles(),
        child: FutureBuilder<List<SongModel>>(
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
                  audioProvider.setPlaylistCount(audioFiles.length);
                  SongModel song = audioFiles[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                    child: Container(
                      child: ListTile(
                        dense: true,
                        leading: audioProvider.songIndex != song.id ? QueryArtworkWidget(
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
                        ) : Lottie.asset(
                          "assets/animations/1715719604390.json",
                          controller: _playChart,
                          repeat: true,
                          height: 40,
                          width: 40
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
                          _playChart.forward();
                          if (audioProvider.songIndex == song.id) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => VibeToMusic(song: song)));
                          } else {
                            audioProvider.currentDuration = Duration.zero;
                            audioProvider.totalDuration = Duration(microseconds: song.duration!);
                            audioProvider.playMusic(song.id, song.uri, song.duration, update);
                            setState(() {
                              playDuration = Duration(milliseconds: song.duration!);
                            });
                            Navigator.push(context, MaterialPageRoute(builder: (context) => VibeToMusic(song: song)));
                          }
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
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}