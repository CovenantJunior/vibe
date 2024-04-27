import 'package:flutter/material.dart';
import 'package:vibe/components/vibe_drawer.dart';
import 'package:vibe/tabs/albums.dart';
import 'package:vibe/tabs/artists.dart';
import 'package:vibe/tabs/folders.dart';
import 'package:vibe/tabs/genres.dart';
import 'package:vibe/tabs/playlists.dart';
import 'package:vibe/tabs/songs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  void search () {

  }

  @override
  void initState() {
    super.initState();
    // Initialize the TabController with the number of tabs you need
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Let\'s Vibe',
              style: TextStyle(
                fontFamily: 'Futura',
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
                  fontFamily: 'Futura'
                ),
              ),
            ),
            Text(
              'Playlists',
              style: TextStyle(
                fontFamily: 'Futura'
              ),
            ),
            Text(
              'Folders',
              style: TextStyle(
                fontFamily: 'Futura'
              ),
            ),
            Text(
              'Albums',
              style: TextStyle(
                fontFamily: 'Futura'
              ),
            ),
            Text(
              'Artists',
              style: TextStyle(
                fontFamily: 'Futura'
              ),
            ),
            Text(
              'Genres',
              style: TextStyle(
                fontFamily: 'Futura'
              ),
            ),
          ]
        ),
        actions: [
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
            child: Songs(),
          ),
          Tab(
            child: Playlists()
          ),
          Tab(
            child: Folders(),
          ),
          Tab(
            child: Albums(),
          ),
          Tab(
            child: Artists(),
          ),
          Tab(
            child: Genres(),
          ),
        ]
      ),
    );
  }
}