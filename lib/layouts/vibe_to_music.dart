import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:vibe/components/vibe_to_lyrics.dart';
import 'package:vibe/components/vibe_to_song.dart';
import 'package:vibe/components/skins.dart';

class VibeToMusic extends StatefulWidget {
  final SongModel song;
  const VibeToMusic({
      super.key,
      required this.song
  });

  @override
  State<VibeToMusic> createState() => _VibeToMusicState();
}

class _VibeToMusicState extends State<VibeToMusic> with TickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
      // Initialize the TabController with the number of tabs you need
      _tabController = TabController(length: 2, vsync: this);
    }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: coolGradients[8][0],
        leading: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 30,)),
        ),
        bottom: TabBar(
          isScrollable: true,
          tabAlignment: TabAlignment.center,
          controller: _tabController,
          indicatorColor: Colors.yellow,
          dividerColor: Colors.transparent,
          tabs: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Song',
                style: TextStyle(
                  fontFamily: 'SpotifyMix'
                ),
              ),
            ),
            Text(
              'Lyrics',
              style: TextStyle(
                fontFamily: 'SpotifyMix'
              ),
            ),
          ]
         )
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Tab(
            child: VibeToSong(song: widget.song)
          ),
          Tab(
            child: VibeToLyrics(song: widget.song)
          )
        ],
      ),
    );
  }
}