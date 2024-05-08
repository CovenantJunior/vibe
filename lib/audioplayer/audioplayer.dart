/*
 List of all Audio Functions 
*/

import 'package:audioplayers/audioplayers.dart';

class Player {

  final AudioPlayer _audioPlayer = AudioPlayer();

  Duration currentDuration = Duration.zero;
  Duration totalDuration = Duration.zero;
  
  bool isPlaying = false;

  bool resume = false;

  
  void playMusic(uri) {
    print(uri);
    _audioPlayer.play(UrlSource(uri));
  }

  void resumeMusic() {
    _audioPlayer.resume();
  }

  void pauseMusic() {

  }

  void nextMusic(uri) {

  }

  void previousMusic(uri) {

  }

  void deleteMusic(uri) {

  }

  void fetchMusicLyrics(title) {

  }
}