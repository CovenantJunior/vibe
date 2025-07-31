import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibe/controller/vibe_controller.dart';
import 'package:vibe/components/skins.dart';
// import 'package:vibration/vibration.dart';

class VibePreference extends StatefulWidget {
  const VibePreference({super.key});

  @override
  State<VibePreference> createState() => _VibePreferenceState();
}

class _VibePreferenceState extends State<VibePreference> {
  int? id;
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
            fontFamily: "Circular",
            fontWeight: FontWeight.w500,
            fontSize: 20
          ),
        ),
        content: Text(
          "Notifications are shown at the best time of the day, just sit back",
          style: TextStyle(
            fontFamily: "Circular",
            fontWeight: FontWeight.w500,
          )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List preferences = context.watch<VibeDatabase>().preferences;

    for (var preference in preferences) {
      setState(() {
        id = preference.id;
        notification = preference.notification;
        vibration = preference.vibration;
      });
    }


    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // Used AppBar just for the back icon
        title: const Text(
          "Preferences",
          style: TextStyle(
            fontFamily: "Circular",
            fontWeight: FontWeight.w500
          ),
        ),
        centerTitle: true,
        backgroundColor: coolGradients[0][0],
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: coolGradients[0],
          ),
        ),
        child: const Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /* const Row(
                          children: [
                            Icon(Icons.dark_mode_outlined),
                            SizedBox(width: 20),
                            Text(
                              'Dark Mode',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                fontFamily: "Circular"
                              ),
                            ),
                          ],
                        ),
                        Transform.scale(
                          scale: .7,
                          child: Switch(
                            value: true,
                            onChanged: (value) {
                              
                            }
                          ),
                        ) */
                      ],
                    ),
                    // Divider(height: 40),
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
                                    fontFamily: "Circular"
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
          ],
        ),
      ),
    );
  }
}