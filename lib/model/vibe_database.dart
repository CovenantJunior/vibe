import 'package:flutter/foundation.dart';
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
        ..darkMode = false
        ..notification = true
        ..vibration = true;
      await isar.writeTxn(() => isar.vibePreferences.put(newPreference));
      preferences = isar.vibePreferences.where().findAllSync();
      notifyListeners();
    } else if (currentPreferences.length > 1) {
      currentPreferences.last.clear();
      // await isar.writeTxn(() => isar.vibePreferences.clear());
      initPreference();
    }
  }

  void themePreference() async {
    final currentPreference = isar.vibePreferences.where().findAllSync();
    if (currentPreference.isEmpty) {
      initPreference();
      isDark = currentPreference.first.darkMode!;
    } else if (currentPreference.length > 1) {
      // await isar.writeTxn(() => isar.vibePreferences.clear());
      initPreference();
    } else {
      // print("Preference length is ${currentPreference.length}");
      isDark = currentPreference.first.darkMode!;
    }
  }

  void fetchPreferences() async {
    List currentPreferences = isar.vibePreferences.where().findAllSync();
    if (currentPreferences.isEmpty) {
      initPreference();
    } else {
      preferences.clear();
      preferences.addAll(currentPreferences);
      isDark = preferences.first.darkMode;
      // print(currentPreferences.length);
      notifyListeners();
    }
  }

  void toggleTheme(id) async {
    var existingPreference = await isar.vibePreferences.get(id);
    // print(existingPreference?.darkMode);
    if (existingPreference != null) {
      existingPreference.darkMode == false ?  existingPreference.darkMode = true : existingPreference.darkMode = false;

      await isar.writeTxn(() => isar.vibePreferences.put(existingPreference));
      preferences.first.darkMode = existingPreference.darkMode;
      isDark = existingPreference.darkMode;

      fetchPreferences();
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