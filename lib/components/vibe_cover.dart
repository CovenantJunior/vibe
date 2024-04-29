import 'package:flutter/material.dart';

class VibeCover extends StatefulWidget {
  const VibeCover({super.key});

  @override
  State<VibeCover> createState() => _VibeCoverState();
}

class _VibeCoverState extends State<VibeCover> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 15,
            offset: const Offset(14, 14)
          ),
          const BoxShadow(
            color: Colors.white,
            blurRadius: 15,
            offset: Offset(-4, -4))
        ]
      ),
    );
  }
}