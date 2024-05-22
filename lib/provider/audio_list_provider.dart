class AudioList {
  late int id;
  late String songTitle;
  late String songUri;
  late Duration songDuration;
  late String album;
  late int albumId;
  late String artist;
  late int artistId;
  late int bookmark;
  late String composer;
  late String data;
  late int dateAdded;
  late int dateModified;
  late String displayName;
  late String displayNameWOExt;
  late int duration;
  late String fileExtension;
  late String genre;
  late int genreId;
  late dynamic getMap;
  late bool isAlarm;
  late bool isAudioBook;
  late bool isMusic;
  late bool isNotification;
  late int isPodcast;
  late bool isRingtone;
  late int size;
  late String title;
  late int track;
  late String uri;

  AudioList({
    required this.id,
    required this.songTitle,
    required this.songUri,
    required this.songDuration,
    required this.album,
    required this.albumId,
    required this.artist,
    required this.artistId,
    required this.bookmark,
    required this.composer,
    required this.data,
    required this.dateAdded,
    required this.dateModified,
    required this.displayName,
    required this.displayNameWOExt,
    required this.duration,
    required this.fileExtension,
    required this.genre,
    required this.genreId,
    required this.getMap,
    required this.isAlarm,
    required this.isAudioBook,
    required this.isMusic,
    required this.isNotification,
    required this.isPodcast,
    required this.isRingtone,
    required this.size,
    required this.title,
    required this.track,
    required this.uri,
  });
}
