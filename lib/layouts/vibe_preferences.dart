import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibe/model/vibe_database.dart';
// import 'package:vibration/vibration.dart';

class VibePreference extends StatefulWidget {
  const VibePreference({super.key});

  @override
  State<VibePreference> createState() => _VibePreferenceState();
}

class _VibePreferenceState extends State<VibePreference> {
  int? id;
  late bool darkMode;
  late bool notification;
  late bool vibration;

  @override
  void initState() {
    super.initState();
    readPreference();
  }

  Future<void> readPreference () async {
    Provider.of<VibeDatabase>(context, listen: false).fetchPreferences();
  }

  void notifyInfo() {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text(
          "Notification",
          style: TextStyle(
            fontFamily: "Futura",
            fontWeight: FontWeight.w500,
            fontSize: 20
          ),
        ),
        content: Text(
          "Notifications are shown at the best time of the day, just sit back",
          style: TextStyle(
            fontFamily: "Futura",
            fontWeight: FontWeight.w500,
          )
        ),
      ),
    );
  }

  void clipBoardInfo() {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text(
          "Clipboard",
          style: TextStyle(
            fontFamily: "Futura",
            fontWeight: FontWeight.w500,
            fontSize: 20
          ),
        ),
        content: Text(
          "Read immediate Clipboard data for a quick task creation",
          style: TextStyle(
            fontFamily: "Futura",
            fontWeight: FontWeight.w500,
          )
        ),
      ),
    );
  }

  void ttsInfo() {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text(
          "Speech to Text",
          style: TextStyle(
            fontFamily: "Futura",
            fontWeight: FontWeight.w500,
            fontSize: 20
          ),
        ),
        content: Text(
          "Fill in task description with your voice",
          style: TextStyle(
            fontFamily: "Futura",
            fontWeight: FontWeight.w500,
          )
        ),
      ),
    );
  }

  void dismissInfo() {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text(
          "Swipe Dismiss",
          style: TextStyle(
            fontFamily: "Futura",
            fontWeight: FontWeight.w500,
            fontSize: 20
          ),
        ),
        content: Text(
            "Swiping to dismiss results in plans being discarded.",
            style: TextStyle(
              fontFamily: "Futura",
              fontWeight: FontWeight.w500,
            )),
      ),
    );
  }

  void bulkTrashInfo() {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text(
          "Bulk Trash",
          style: TextStyle(
            fontFamily: "Futura",
            fontWeight: FontWeight.w500,
            fontSize: 20
          ),
        ),
        content: Text(
            "This option helps you clear all tasks/plans in one tap",
            style: TextStyle(
              fontFamily: "Futura",
              fontWeight: FontWeight.w500,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List preferences = context.watch<VibeDatabase>().preferences;

    for (var preference in preferences) {
      setState(() {
        id = preference.id;
        darkMode = preference.darkMode;
        notification = preference.notification;
        vibration = preference.vibration;
      });
    }


    return Scaffold(
      appBar: AppBar(
        // Used AppBar just for the back icon
        title: const Text(
          "Preferences",
          style: TextStyle(
            fontFamily: "Futura",
            fontWeight: FontWeight.w500
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        darkMode == true ? const Icon(Icons.dark_mode_outlined) : const Icon(Icons.light_mode_outlined),
                        const SizedBox(width: 20),
                        Text(
                          darkMode == true ? 'Dark Mode' : 'Light Mode',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            fontFamily: "Futura"
                          ),
                        ),
                      ],
                    ),
                    Transform.scale(
                      scale: .7,
                      child: Switch(
                        value: darkMode,
                        onChanged: (value) {
                          Provider.of<VibeDatabase>(context, listen: false).toggleTheme(id);
                        }
                      ),
                    )
                  ],
                ),
                const Divider(height: 40),
                /* Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        notification == true ? const Icon(Icons.notifications_none_rounded) : const Icon(Icons.notifications_off_outlined),
                        const SizedBox(width: 20),
                        Row(
                          children: [
                            const Text(
                              'Notification',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                fontFamily: "Futura"
                              ),
                            ),
                            const SizedBox(width: 7),
                            Baseline(baseline: 10.0,
                            baselineType: TextBaseline.alphabetic,
                            child: GestureDetector(onTap: notifyInfo, child: const Icon(Icons.help_outline_rounded, size: 15)))
                          ],
                        ),
                      ],
                    ),
                    Transform.scale(
                      scale: .7,
                      child: Switch(
                        value: notification,
                        onChanged: (value) {
                          notification == true ? NotificationService().cancelAllnotification() : Void;
                          Provider.of<VibeDatabase>(context, listen: false).setNotification(id);
                        }
                      ),
                    )
                  ],
                ), */
              ],
            ),
          ),
        ),
      ),
    );
  }
}