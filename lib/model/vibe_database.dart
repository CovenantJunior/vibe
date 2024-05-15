import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vibe/model/vibe_preferences.dart';

class VibeDatabase extends ChangeNotifier {
  static late Isar isar;

  // Initialize DB
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
        [VibePreferencesSchema],
        directory: dir.path);
  }

  List preferences = [];
  bool? isDark;

  /* PREFERENCES METHODS */

  void initPreference() async {
    List currentPreferences = isar.vibePreferences.where().findAllSync();
    if (currentPreferences.isEmpty) {
      final newPreference = VibePreferences()
        ..notification = true
        ..vibration = true;
      await isar.writeTxn(() => isar.vibePreferences.put(newPreference));
      preferences = isar.vibePreferences.where().findAllSync();
      WidgetsBinding.instance.addPostFrameCallback((_){
        notifyListeners();
      });
    } else if (currentPreferences.length > 1) {
      currentPreferences.last.clear();
      // await isar.writeTxn(() => isar.vibePreferences.clear());
      initPreference();
    }
  }

  void fetchPreferences() async {
    List currentPreferences = isar.vibePreferences.where().findAllSync();
    if (currentPreferences.isEmpty) {
      initPreference();
    } else {
      preferences.clear();
      preferences.addAll(currentPreferences);
      // print(currentPreferences.length);
      WidgetsBinding.instance.addPostFrameCallback((_){
        notifyListeners();
      });
    }
  }

  void toggleSkin(id) async {
    var existingPreference = await isar.vibePreferences.get(id);
    // print(existingPreference?.skin);
    if (existingPreference != null) {
      existingPreference.skin == id;

      await isar.writeTxn(() => isar.vibePreferences.put(existingPreference));
      preferences.first.skin = existingPreference.skin;

      fetchPreferences();
    }
  }
}