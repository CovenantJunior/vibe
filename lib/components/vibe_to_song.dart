import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';
import 'package:vibe/provider/audio_provider.dart';
import 'package:vibe/components/vibe_cover.dart';
import 'package:vibe/skins.dart';

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
    var audioProvider = Provider.of<AudioProvider>(context, listen: true);
    int sec = widget.song.duration!;
    int songCurrentDuration = audioProvider.currentDuration.inSeconds;
    int songDuration = Duration(milliseconds: sec).inSeconds;

    void update() {
      setState(() {
        
      });
    }
     
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: coolGradients[8],
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
                            artworkHeight: 250,
                            artworkWidth: 250,
                            artworkBorder: BorderRadius.circular(10),
                            nullArtworkWidget: QueryArtworkWidget(
                              id: widget.song.id,
                              type: ArtworkType.AUDIO,
                              artworkHeight: 250,
                              artworkWidth: 250,
                              artworkBorder: BorderRadius.circular(10),
                              nullArtworkWidget: Icon(
                                Icons.library_music_outlined,
                                size: 200,
                                color: coolGradients[8][0],
                              ),
                            )
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
                          fontFamily: 'Futura',
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    )),
                    Center(
                      child: Text(
                        widget.song.artist!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Futura', fontWeight: FontWeight.w400
                        ),
                    )),
                  ],
                ).animate().scale().flipV(
                  duration: const Duration(milliseconds: 400)
                ),
              ),
            ),
            
            const SizedBox(height: 70),
        
            // Controls
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Slider(
                    min: 0, 
                    max: 1,
                    value: mounted ? (audioProvider.currentDuration.inMilliseconds / audioProvider.totalDuration.inMilliseconds) : 0,
                    onChanged: (value) {
                      audioProvider.currentDuration = Duration(milliseconds: (audioProvider.totalDuration.inMilliseconds * value).toInt());
                      audioProvider.seekDuration(audioProvider.currentDuration);
                    },
                    onChangeEnd: (value) {
                      audioProvider.currentDuration = Duration(milliseconds: (audioProvider.totalDuration.inMilliseconds * value).toInt());
                      audioProvider.seekDuration(audioProvider.currentDuration);
                    },
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${(songCurrentDuration / 60).floor().toString()}:${(songCurrentDuration % 60).toString().padLeft(2, '0')}",
                          style: const TextStyle(
                            fontFamily: 'Futura',
                          ),
                        ),
                        Text(
                          "${(songDuration / 60).floor().toString()}:${(songDuration % 60).toString().padLeft(2, '0')}",
                          style: const TextStyle(
                            fontFamily: 'Futura',
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            audioProvider.previousMusic(widget.song.id, widget.song.uri, widget.song.duration, update);
                          },
                          icon: const Icon(
                            Icons.skip_previous_outlined,
                            size: 30,
                          )
                        ),
                        audioProvider.isPlaying == true ? IconButton(
                          onPressed: (){
                            audioProvider.pauseMusic(widget.song.uri);
                          },
                          icon: const Icon(
                            Icons.pause_outlined,
                            size: 30,
                          )
                        ) : IconButton(
                          onPressed: (){
                            audioProvider.playMusic(widget.song.id, widget.song.uri, widget.song.duration, update);
                          },
                          icon: const Icon(
                            Icons.play_arrow_outlined,
                            size: 30,
                          )
                        ),
                        IconButton(
                          onPressed: () {
                            audioProvider.nextMusic(widget.song.id, widget.song.uri, widget.song.duration, update);
                          },
                          icon: const Icon(
                            Icons.skip_next_outlined,
                            size: 30,
                          )
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}