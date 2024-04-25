import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibe/model/vibe_database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int? id;
    context.watch<VibeDatabase>().fetchPreferences();
    List preferences = context.watch<VibeDatabase>().preferences;
    id = preferences.last.id;
    return Scaffold(
      body: Center(child: ElevatedButton(onPressed: () {
        context.read<VibeDatabase>().toggleTheme(id);
      }
      , child: const Text("Let's Vibe"))),
    );
  }
}