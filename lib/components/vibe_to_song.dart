import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:vibe/components/vibe_controls.dart';
import 'package:vibe/components/vibe_cover.dart';
import 'package:vibe/components/skins.dart';

class VibeToSong extends StatefulWidget {
  final SongModel song;
  const VibeToSong({
      super.key,
      required this.song
  });


  @override
  State<VibeToSong> createState() => _VibeToSongState();
}

class _VibeToSongState extends State<VibeToSong> { 

  @override
  Widget build(BuildContext context) {
         
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: coolGradients[0],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    VibeCover(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: QueryArtworkWidget(
                            id: widget.song.id,
                            type: ArtworkType.AUDIO,
                            format: ArtworkFormat.PNG,
                            artworkHeight: 250,
                            artworkWidth: 250,
                            artworkBorder: BorderRadius.circular(10),
                            nullArtworkWidget: Icon(
                              Icons.library_music_outlined,
                              size: 200,
                              color: coolGradients[0][0],
                            ),
                          ),
                        ),
                      )
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: Text(
                        widget.song.title,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                          fontFamily: 'SpotifyMix',
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    )),
                    Center(
                      child: Text(
                        widget.song.artist!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'SpotifyMix', fontWeight: FontWeight.w400
                        ),
                    )),
                  ],
                ).animate().scale().flipV(
                  duration: const Duration(milliseconds: 400)
                ),
              ),
            ),
            
            const SizedBox(height: 70),
        
            VibeControl(song: widget.song)
          ],
        ),
      ),
    );
  }
}