import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibe/layouts/vibe_homepage.dart';
import 'package:vibe/layouts/vibe_preferences.dart';
import 'package:vibe/model/vibe_database.dart';
import 'package:vibe/provider/audio_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await VibeDatabase.initialize();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => VibeDatabase(),
        ),
        ChangeNotifierProvider(
          create: (context) => AudioProvider(),
        )
      ],
      child: const Vibe()
    )
  );
}

class Vibe extends StatefulWidget {
  const Vibe({super.key});

  @override
  State<Vibe> createState() => _VibeState();
}

class _VibeState extends State<Vibe> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: {
        '/home': (context) => const HomePage(),
        '/preferences': (context) => const VibePreference(),
      },
      home: const HomePage(),
    );
  }
}