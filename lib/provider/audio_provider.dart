import 'dart:async';

import 'package:flutter/material.dart';
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
  Duration? totalDuration;
  
  bool isPlaying = false;

  bool resume = false;

  bool paused = false;
  
  Future<void> playMusic(id, uri, duration, update) async {
    _audioPlayer.stop();
    setSongIndex(id);
    totalDuration = Duration(milliseconds: duration);
    if (paused != true) {
      currentDuration = Duration.zero;
      _audioPlayer.setUrl(uri);
    }
    await _audioPlayer.seek(currentDuration);
    _audioPlayer.play();
    isPlaying = true;
    resume = false;
    paused = false;
    notifyListeners();
    _audioPlayer.playerStateStream.listen((state) {
      if (state.playing) {
        _audioPlayer.positionStream.listen((event) {
          currentDuration = _audioPlayer.position;
          if (currentDuration >= totalDuration!) {
            currentDuration = Duration.zero;
            stopMusic();
          }
          notifyListeners();
          update;
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
    paused = true;
    notifyListeners();
  }

  void nextMusic(id, uri, duration, update) async {
    if (id < (playlistCount! - 1)) {
      songIndex = id;
      playMusic(id, uri, duration, update);
    } else {
      // Last song playing (if not shuffling)
    }
  }

  void previousMusic(id, uri, duration, update) async {    
    if (id >= 0) {
      songIndex = id;
      playMusic(id, uri, duration, update);
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