import 'package:flutter/material.dart';

class VibeDrawerTile extends StatelessWidget {
  final String title;
  final Widget leading;
  final void Function()? onTap;

  const VibeDrawerTile(
    {
      super.key,
      required this.title,
      required this.leading,
      required this.onTap
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Gotham'
          ),
        ),
        leading: leading,
        onTap: onTap,
      ),
    );
  }
}