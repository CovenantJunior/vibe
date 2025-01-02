import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter_close_app/flutter_close_app.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:vibe/components/vibe_bottom_sheet.dart';
import 'package:vibe/components/vibe_drawer.dart';
import 'package:vibe/layouts/vibe_to_music.dart';
import 'package:vibe/provider/audio_provider.dart';
import 'package:vibe/tabs/albums.dart';
import 'package:vibe/tabs/apple_music.dart';
import 'package:vibe/tabs/artists.dart';
import 'package:vibe/tabs/folders.dart';
import 'package:vibe/tabs/genres.dart';
import 'package:vibe/tabs/playlists.dart';
import 'package:vibe/tabs/songs.dart';
import 'package:vibe/tabs/spotify.dart';
import 'package:vibe/components/skins.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  Future<void> requestPermissions() async {
    if (await Permission.storage.request().isGranted) {
      // Permission granted, you can proceed
    } else {
      // Permission denied, close app
      // FlutterCloseApp.close();
      Fluttertoast.showToast(
        msg: "App may malfunctoin without granted permissions",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white
      );
    }
  }

  late TabController _tabController;
  void search () {
    // search
  }


  @override
  void initState() {
    super.initState();
    // Initialize the TabController with the number of tabs you need
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var audioProvider = context.watch<AudioProvider>();
    void vibeMusic() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => PopScope(
        onPopInvokedWithResult: (a, b) {
        },
        child: DraggableScrollableSheet(
          initialChildSize: 1,
          minChildSize: 1,
          maxChildSize: 1,
          builder: (BuildContext context, ScrollController scrollController) { 
            return VibeToMusic(song: audioProvider.song!);
          }
        )
      )
    );
  }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: coolGradients[8][0],
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Let\'s Vibe',
              style: TextStyle(
                fontFamily: 'SpotifyMix',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 5),
            Icon(
              Icons.celebration_outlined
            )
          ],
        ),
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
                'Songs',
                style: TextStyle(
                  fontFamily: 'SpotifyMix'
                ),
              ),
            ),
            Text(
              'Playlists',
              style: TextStyle(
                fontFamily: 'SpotifyMix'
              ),
            ),
            Text(
              'Folders',
              style: TextStyle(
                fontFamily: 'SpotifyMix'
              ),
            ),
            Text(
              'Albums',
              style: TextStyle(
                fontFamily: 'SpotifyMix'
              ),
            ),
            Text(
              'Artists',
              style: TextStyle(
                fontFamily: 'SpotifyMix'
              ),
            ),
            Text(
              'Genres',
              style: TextStyle(
                fontFamily: 'SpotifyMix'
              ),
            ),
            Text(
              'Spotify',
              style: TextStyle(
                fontFamily: 'SpotifyMix'
              ),
            ),
            Text(
              'Apple Music',
              style: TextStyle(
                fontFamily: 'SpotifyMix'
              ),
            ),
          ]
        ),
        actions: [
          Tooltip(
            message: "Theme",
            child: IconButton(
              onPressed: search,
              icon: const Icon(Icons.color_lens_outlined)
            ),
          ),
          Tooltip(
            message: "Search",
            child: IconButton(
              onPressed: search,
              icon: const Icon(Icons.search_rounded)
            ),
          )
        ],
      ),
      drawer: const VibeDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Tab(
            child: Songs()
          ),
          Tab(
            child: Playlists()
          ),
          Tab(
            child: Folders()
          ),
          Tab(
            child: Albums()
          ),
          Tab(
            child: Artists()
          ),
          Tab(
            child: Genres()
          ),
          Tab(
            child: Spotify()
          ),
          Tab(
            child: AppleMusic()
          ),
        ]
      ),
      bottomSheet: audioProvider.isAlive ? GestureDetector(
        child: const VibeBottomSheet(),
        onVerticalDragStart: (e) => vibeMusic(),
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => VibeToMusic(song: audioProvider.song!)));
          vibeMusic();
        },
      ) : null
    );
  }
}