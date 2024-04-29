import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibe/layouts/vibe_homepage.dart';
import 'package:vibe/layouts/vibe_preferences.dart';
import 'package:vibe/layouts/vibe_to_music.dart';
import 'package:vibe/model/vibe_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await VibeDatabase.initialize();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => VibeDatabase(),
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
    context.read<VibeDatabase>().themePreference();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.watch<VibeDatabase>().isDark == true ? ThemeData.dark() : ThemeData.light(),
      routes: {
        '/home': (context) => const HomePage(),
        '/preferences': (context) => const VibePreference(),
        '/vibe': (context) => const VibeToMusic()
      },
      home: const HomePage(),
    );
  }
}