import 'package:flutter/material.dart';
import 'package:vibe/layouts/home_page.dart';

void main() {
  runApp(const Vibe());
}

class Vibe extends StatefulWidget {
  const Vibe({super.key});

  @override
  State<Vibe> createState() => _VibeState();
}

class _VibeState extends State<Vibe> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}