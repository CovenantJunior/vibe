import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:vibe/components/vibe_to_lyrics.dart';
import 'package:vibe/components/vibe_to_song.dart';

class VibeToMusic extends StatefulWidget {
  final SongModel song;
  const VibeToMusic({
      super.key,
      required this.song
  });

  @override
  State<VibeToMusic> createState() => _VibeToMusicState();
}

class _VibeToMusicState extends State<VibeToMusic> with SingleTickerProviderStateMixin {

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
        bottom: TabBar(
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          controller: _tabController,
          indicatorColor: Colors.yellow,
          dividerColor: Colors.transparent,
          tabs: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Song',
                style: TextStyle(
                  fontFamily: 'Futura'
                ),
              ),
            ),
            Text(
              'Lyrics',
              style: TextStyle(
                fontFamily: 'Futura'
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