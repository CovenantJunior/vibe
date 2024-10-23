import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

/*
 List of all Audio Functions 
*/
class AudioProvider extends ChangeNotifier{

  SongModel? song;

  final _audioPlayer = AudioPlayer();

  final playerState = PlayerState;

  int? playlistCount;

  Duration currentDuration = Duration.zero;
  Duration totalDuration = Duration.zero;

  bool isAlive = false;
  
  bool isPlaying = false;

  bool resume = false;

  bool paused = false;
  
  int? songIndex;

  String? songTitle;

  String? songArtist;

  String? songUri;

  Future<void> playMusic(id, uri, duration, update) async {
    _audioPlayer.stop();
    totalDuration = Duration(milliseconds: duration);
    if (paused != true || songIndex != id) {
      setSongIndex(id);
      currentDuration = Duration.zero;
      _audioPlayer.setUrl(uri);
    }
    await _audioPlayer.seek(currentDuration);
    _audioPlayer.play();
    isPlaying = true;
    resume = false;
    paused = false;
    isAlive = true;
    WidgetsBinding.instance.addPostFrameCallback((_){
      notifyListeners();
    });
    _audioPlayer.playerStateStream.listen((state) {
      if (state.playing) {
        _audioPlayer.positionStream.listen((event) {
          currentDuration = _audioPlayer.position;
          if (currentDuration >= totalDuration) {
            currentDuration = Duration.zero;
            stopMusic();
          }
          WidgetsBinding.instance.addPostFrameCallback((_){
            notifyListeners();
          });
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
    WidgetsBinding.instance.addPostFrameCallback((_){
      notifyListeners();
    });
  }

  void resumeMusic() async {
    await _audioPlayer.play();
    isPlaying = true;
    resume = false;
    paused = false;
    WidgetsBinding.instance.addPostFrameCallback((_){
      notifyListeners();
    });
  }

  void pauseMusic(uri) async {
    await _audioPlayer.pause();
    isPlaying = false;
    resume = true;
    paused = true;
    WidgetsBinding.instance.addPostFrameCallback((_){
      notifyListeners();
    });
  }

  void nextMusic(id, uri, duration, update) async {
    if (id < (playlistCount! - 1)) {
      id = id;
      playMusic(id, uri, duration, update);
    } else {
      // Last song playing (if not shuffling)
    }
  }

  void previousMusic(id, uri, duration, update) async {    
    if (id >= 0) {
      id = id;
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
    WidgetsBinding.instance.addPostFrameCallback((_){
      notifyListeners();
    });
  }

  void setSongIndex (id) {
    songIndex = id;
    WidgetsBinding.instance.addPostFrameCallback((_){
      notifyListeners();
    });
  }
}