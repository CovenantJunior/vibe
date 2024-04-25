import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:vibe/model/vibe_preferences.dart';

class VibeDatabase extends ChangeNotifier {
  static late Isar isar;

  // Initialize DB
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
        [VibePreferences],
        directory: dir.path);
  }
}