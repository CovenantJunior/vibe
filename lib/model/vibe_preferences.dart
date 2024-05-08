import 'package:isar/isar.dart';

// Generate collection file by running `dart run build_runner build`
part 'vibe_preferences.g.dart';

@Collection()
class VibePreferences {
  Id id = Isar.autoIncrement;
  bool? darkMode;
  bool? notification;
  bool? vibration;
  int? skin;
}