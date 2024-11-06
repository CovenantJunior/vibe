import 'package:isar/isar.dart';
import 'package:vibe/provider/audio_provider.dart';

// Generate collection file by running `dart run build_runner build`
part 'vibe_preferences.g.dart';

@Collection()
class VibePreferences {
  Id id = Isar.autoIncrement;
  bool? notification;
  bool? vibration;
  int? skin;
  @ignore
  List<AudioProvider>? lastPlayer;
}