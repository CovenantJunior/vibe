import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:vibe/audioplayer/audioplayer.dart';
import 'package:vibe/components/vibe_cover.dart';

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
    int sec = widget.song.duration!;
    int songDuration = Duration(milliseconds: sec).inSeconds;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
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
                            quality: 100,
                            artworkHeight: 250,
                            artworkWidth: 250,
                            artworkBorder: BorderRadius.circular(10),
                            nullArtworkWidget: const Icon(
                              Icons.library_music_outlined,
                              size: 200,
                              color: Color.fromARGB(255, 202, 202, 123),
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
                          fontFamily: 'Futura',
                          fontSize: 16,
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
              
              const SizedBox(height: 70),
      
              // Controls
              Column(
                children: [
                  Slider(
                    min: 0,
                    max: 1,
                    value: 0,
                    activeColor: const Color.fromARGB(255, 202, 202, 123),
                    thumbColor: const Color.fromARGB(255, 202, 202, 123),
                    onChanged: (value) {
                  
                    }
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "0:00",
                          style: TextStyle(
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
                            Player().previousMusic(widget.song.uri);
                          },
                          icon: const Icon(
                            Icons.skip_previous_outlined,
                            size: 30,
                            color: Color.fromARGB(255, 202, 202, 123),
                          )
                        ),
                        Player().isPlaying == true ? IconButton(
                          onPressed: (){
                            Player().pauseMusic();
                            Player().isPlaying = false;
                            Player().resume = true;
                          },
                          icon: const Icon(
                            Icons.pause_outlined,
                            size: 30,
                            color: Color.fromARGB(255, 202, 202, 123),
                          )
                        ) : Player().resume == false ? IconButton(
                          onPressed: (){
                            Player().playMusic(widget.song.uri);
                            Player().isPlaying = true;
                            Player().resume = false;
                          },
                          icon: const Icon(
                            Icons.play_arrow_outlined,
                            size: 30,
                            color: Color.fromARGB(255, 202, 202, 123),
                          )
                        ) : IconButton(
                          onPressed: (){
                            Player().resumeMusic();
                            Player().isPlaying = true;
                            Player().resume = false;
                          },
                          icon: const Icon(
                            Icons.play_arrow_outlined,
                            size: 30,
                            color: Color.fromARGB(255, 202, 202, 123),
                          )
                        ),
                        IconButton(
                          onPressed: () {
                            Player().nextMusic(widget.song.uri);
                          },
                          icon: const Icon(
                            Icons.skip_next_outlined,
                            size: 30,
                            color: Color.fromARGB(255, 202, 202, 123),
                          )
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
    );
  }
}