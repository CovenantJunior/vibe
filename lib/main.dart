import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibe/layouts/home_page.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.read<VibeDatabase>().preferences.first.darkMode == true ? ThemeData.dark() : ThemeData.light(),
      home: const HomePage(),
    );
  }
}