import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';
import 'package:vibe/provider/audio_provider.dart';

class VibeControl extends StatefulWidget {
  final SongModel song;
  const VibeControl({
      super.key,
      required this.song
  });


  @override
  State<VibeControl> createState() => _VibeControlState();
}

class _VibeControlState extends State<VibeControl> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController _playChart;
  late Duration playDuration;

  @override
  void initState() {
    super.initState();
    _playChart = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5)
    );
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var audioProvider = context.watch<AudioProvider>();
    audioProvider.isPlaying ? _playChart.repeat() : _playChart.reset();
    int sec = widget.song.duration!;
    int songCurrentDuration = audioProvider.currentDuration.inSeconds;
    int songDuration = Duration(milliseconds: sec).inSeconds;

    void update() {
      setState(() {
        
      });
    }

    return Expanded(
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
                    fontFamily: 'SpotifyMix',
                  ),
                ),
                Text(
                  "${(songDuration / 60).floor().toString()}:${(songDuration % 60).toString().padLeft(2, '0')}",
                  style: const TextStyle(
                    fontFamily: 'SpotifyMix',
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
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}