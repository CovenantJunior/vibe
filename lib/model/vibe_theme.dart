import 'package:isar/isar.dart';

// Generate collection file by running `dart run build_runner build`
part 'vibe_theme.g.dart';

@Collection()
class VibeTheme {
  Id id = Isar.autoIncrement;
  String? theme;
}
