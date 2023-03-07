import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MaterialApp(home: MyAudioPlayer()));

class MyAudioPlayer extends StatefulWidget {
  const MyAudioPlayer({Key? key}) : super(key: key);

  @override
  _MyAudioPlayerState createState() => _MyAudioPlayerState();
}

class _MyAudioPlayerState extends State<MyAudioPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('Play Song'),
          onPressed: _go,
        ),
      ),
    );
  }

  void _go() {
    debugPrint('button pressed!');
    Future<Stream<List<int>>> mystream = giveMeStream();
    Stream<List<int>> myactualstream;
    mystream.then((value) => playMusicFromStream(value));
  }
}

void playMusicFromStream(Stream<List<int>> stream) async {
  final player = AudioPlayer();
  final streamAudioSource = StreamAudioSource(
    stream: stream.asBroadcastStream(),
  );
  await player.setAudioSource(streamAudioSource);
  player.play();
}

class StreamAudioSource extends AudioSource {
  final Stream<List<int>> stream;

  StreamAudioSource({
    required this.stream,
  });

  @override
  Future<IndexedAudioSource> resolve() async {
    // final file = await createFile();
    final file = await _localFile;
    final sink = file.openWrite();

    try {
      await stream.pipe(sink);
      await sink.flush();
    } catch (e) {
      await sink.close();
      await file.delete();
      rethrow;
    }
    await sink.close();
    return ProgressiveAudioSource(Uri.file(file.path));
  }

  @override
  // TODO: implement sequence
  List<IndexedAudioSource> get sequence =>
      List.filled(1, StreamAudioSource(stream: stream) as IndexedAudioSource);

  @override
  // TODO: implement shuffleIndicesprint("UnimplementedError shuffle")
  List<int> get shuffleIndices => List.filled(1, 1);
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/counter.txt');
}

Future<Stream<List<int>>> giveMeStream() async {
  // Open README.md as a byte stream
  Stream<List<int>> fileStream = File('assets/stomp.mp3').openRead();
  return fileStream;
}
