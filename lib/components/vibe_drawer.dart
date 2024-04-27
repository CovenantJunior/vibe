import 'package:flutter/material.dart';
import 'package:vibe/components/vibe_drawer_tile.dart';
import 'package:vibe/layouts/vibe_preferences.dart';

class VibeDrawer extends StatefulWidget {
  const VibeDrawer({super.key});

  @override
  State<VibeDrawer> createState() => _VibeDrawerState();
}

class _VibeDrawerState extends State<VibeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const DrawerHeader(
              child: Icon(
                  Icons.music_note_outlined,
                  color: Colors.yellow,
                ),
              ),

            VibeDrawerTile(
              title: 'Home',
              leading: const Icon(Icons.home_outlined),
              onTap: () {
                Navigator.pop(context);                
              }),

            VibeDrawerTile(
              title: 'Preferences',
              leading: const Icon(Icons.settings_suggest_sharp),
              // leading: const Icon(Icons.settings_outlined),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const VibePreference()));  
              }),
          ]
        ),
      ),
    );
  }
}