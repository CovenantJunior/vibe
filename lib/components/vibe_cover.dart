import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibe/model/vibe_database.dart';

class VibeCover extends StatefulWidget {
  final Widget child;
   const VibeCover({
    super.key,
    required this.child
  });

  @override
  State<VibeCover> createState() => _VibeCoverState();
}

class _VibeCoverState extends State<VibeCover> {
  @override
  Widget build(BuildContext context) {
    context.read<VibeDatabase>().fetchPreferences();
    return context.read<VibeDatabase>().preferences.first.darkMode == false ? Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 10,
            offset: const Offset(4, 4)
          ),
          const BoxShadow(
            color: Colors.white,
            blurRadius: 10,
            offset: Offset(-4, -4)
          )
        ]
      ),
      child: widget.child,
    ) : Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
          ),
          const BoxShadow(
            color: Colors.white,
          )
        ]
      ),
      child: widget.child,
    );
  }
}