import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

/*
 List of all Audio Functions 
*/
class AudioProvider extends ChangeNotifier{

  final AudioPlayer _audioPlayer = AudioPlayer(
    playerId: "0"
  );

  final playerState = PlayerState;

  int? playlistCount;

  int? songIndex;
  Duration currentDuration = Duration.zero;
  Duration totalDuration = Duration.zero;
  
  bool isPlaying = false;

  bool resume = false;

  void timer () {
    
  }

  
  Future<void> playMusic(id, uri, duration) async {
    stopMusic();
    setSongIndex(id);
    _audioPlayer.setReleaseMode(ReleaseMode.release);
    totalDuration = Duration(microseconds: duration);
    await _audioPlayer.play(UrlSource(uri));
    _audioPlayer.onPlayerComplete.listen((event) {
      print("Stop");
      currentDuration = Duration.zero;
      stopMusic();
    });
    _audioPlayer.onPositionChanged.listen((Duration position) {
      currentDuration = position;
      print((currentDuration.inSeconds/totalDuration.inSeconds).ceilToDouble());
    });
    isPlaying = true;
    resume = false;
    notifyListeners();
  }
 
  Future<void> stopMusic() async {
    await _audioPlayer.stop();
    currentDuration = Duration.zero;
    isPlaying = false;
    resume = true;
    notifyListeners();
  }

  void resumeMusic() async {
    await _audioPlayer.resume();
    isPlaying = true;
    resume = false;
    notifyListeners();
  }

  void pauseMusic() async {
    await _audioPlayer.pause();
    isPlaying = false;
    resume = true;
    notifyListeners();
  }

  void nextMusic(id, uri, duration) async {
    if (id < (playlistCount! - 1)) {
      songIndex = id;
      await _audioPlayer.stop();
      playMusic(id, uri, duration);
    } else {
      // Last song playing (if not shuffling)
    }
  }

  void previousMusic(id, uri, duration) async {
    if (id >= 0) {
      songIndex = id;
      await _audioPlayer.stop();
      playMusic(id, uri, duration);
    } else {
      // First song playing (if not shuffling)
    }
  }

  void seekDuration(position) async {
    await _audioPlayer.seek(position);
  }

  void deleteMusic(uri) async {
    // get permission then delete
  }

  void fetchMusicLyrics(title) async {
    // http
  }

  void setPlaylistCount(count) {
    playlistCount = count;
    notifyListeners();
  }

  void setSongIndex (id) {
    songIndex = id;
    notifyListeners();
  }

  void setTotalDuration(duration) {
    totalDuration = duration;
    notifyListeners();
  }
}