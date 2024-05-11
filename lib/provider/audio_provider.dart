import 'dart:async';

import 'package:just_audio/just_audio.dart';
import 'package:flutter/foundation.dart';

/*
 List of all Audio Functions 
*/
class AudioProvider extends ChangeNotifier{

  final _audioPlayer = AudioPlayer();

  final playerState = PlayerState;

  int? playlistCount;

  int? songIndex;
  Duration currentDuration = Duration.zero;
  Duration totalDuration = Duration.zero;
  
  bool isPlaying = false;

  bool resume = false;
  
  Future<void> playMusic(id, uri, duration) async {
    _audioPlayer.stop();
    setSongIndex(id);
    totalDuration = Duration(milliseconds: duration);
    await _audioPlayer.seek(currentDuration);
    _audioPlayer.play();
    isPlaying = true;
    resume = false;
    notifyListeners();
    _audioPlayer.playerStateStream.listen((state) {
      if (state.playing) {
        _audioPlayer.positionStream.listen((event) {
          currentDuration = _audioPlayer.position;
          if (currentDuration == totalDuration) {
            currentDuration = Duration.zero;
            isPlaying = false;
          }
          notifyListeners();
        });
      } else {
        /* switch (state.processingState) {
          /* case ProcessingState.idle: ...
          case ProcessingState.loading: ...
          case ProcessingState.buffering: ...
          case ProcessingState.ready: ... */
          case ProcessingState.completed: stopMusic();
          default: stopMusic();
        } */
      }
    });
  }
 
  Future<void> stopMusic() async {
    await _audioPlayer.stop();
    currentDuration = Duration.zero;
    isPlaying = false;
    resume = false;
    notifyListeners();
  }

  void resumeMusic() async {
    await _audioPlayer.play();
    isPlaying = true;
    resume = false;
    notifyListeners();
  }

  void pauseMusic(uri) async {
    await _audioPlayer.pause();
    isPlaying = false;
    resume = true;
    notifyListeners();
  }

  void nextMusic(id, uri, duration) async {
    if (id < (playlistCount! - 1)) {
      songIndex = id;
      playMusic(id, uri, duration);
    } else {
      // Last song playing (if not shuffling)
    }
  }

  void previousMusic(id, uri, duration) async {    
    if (id >= 0) {
      songIndex = id;
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
}