import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class VibeBottomSheet extends StatefulWidget {
  const VibeBottomSheet({super.key});

  @override
  State<VibeBottomSheet> createState() => _VibeBottomSheetState();
}

class _VibeBottomSheetState extends State<VibeBottomSheet> with SingleTickerProviderStateMixin {
  late AnimationController _playChart;

  @override
  void initState() {
    super.initState();
    _playChart = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5)
    );
    // _playChart.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Lottie.asset(
        "assets/animations/1715719604390.json",
        controller: _playChart,
        repeat: true,
        height: 40,
        width: 40
      ),
      title: const Text(
        "Title",
        style: TextStyle(
          fontFamily: 'Futura'
        ),
      ),
      subtitle: const Text(
        'Unknown Artist',
        style: TextStyle(
          fontFamily: 'Futura'
        ),
      ),
    );
  }
}