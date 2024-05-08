import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

/*
 List of all Audio Functions 
*/
class AudioProvider extends ChangeNotifier{

  final AudioPlayer _audioPlayer = AudioPlayer();

  int? playlistCount;

  int? songIndex;
  Duration currentDuration = Duration.zero;
  Duration totalDuration = Duration.zero;
  
  bool isPlaying = false;

  bool resume = false;

  void timer () {
    
  }

  
  void playMusic(id, uri, duration) async {
    setSongIndex(id);
    await _audioPlayer.play(UrlSource(uri));
    _audioPlayer.onPlayerComplete.listen((event) {
      _audioPlayer.stop();
    });
    isPlaying = true;
    resume = false;
    notifyListeners();

    timer();
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

  void nextMusic(id, uri) async {
    if (id < (playlistCount! - 1)) {
      songIndex = id;
      await _audioPlayer.stop();
      await _audioPlayer.play(uri);
    } else {
      // Last song playing (if not shuffling)
    }
  }

  void previousMusic(id, uri) async {
    if (id >= 0) {
      songIndex = id;
      await _audioPlayer.stop();
      await _audioPlayer.play(uri);
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
}