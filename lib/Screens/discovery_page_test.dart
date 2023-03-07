
// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_application/theme/theme_constants.dart';
import 'package:searchable_listview/searchable_listview.dart';

class ExampleApp extends StatefulWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  final List<Song> songs = [
    Song(songName: 'Bohemian Rhapsody', artist: 'Queen'),
    Song(songName: 'Waterloo', artist: 'Abba'),
    Song(songName: 'Flowers', artist: 'Miley Cyrus'),
    Song(songName: 'Lollipop', artist: 'Micah'),    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            const Text('Search for a song', style: TextStyle(
              color: COLOR_SECONDARY,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SearchableList<Song>(
                  //style: const TextStyle(fontSize: 25),
                  onPaginate: () async {
                    await Future.delayed(const Duration(milliseconds: 1000));
                    setState(() {
                      songs.addAll([
                        Song(songName: 'Fathi', artist: 'Hadawi'),  
                      ]);
                    });
                  },
                  builder: (Song song) => SongItem(song: song),
                  loadingWidget: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(COLOR_SECONDARY),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Loading songs...',
                        style: TextStyle(color: COLOR_SECONDARY),
                      )
                    ],
                  ),
                  errorWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Error while fetching songs',
                        style: TextStyle(color: COLOR_SECONDARY),
                      )
                    ],
                  ),
                  asyncListCallback: () async {
                    await Future.delayed(
                      const Duration(
                        milliseconds: 10000,
                      ),
                    );
                    return songs;
                  },
                  asyncListFilter: (q, list) {
                    return list
                        .where((element) => element.songName.contains(q) || element.artist.contains(q))
                        .toList();
                  },
                  emptyWidget: const EmptyView(),
                  onRefresh: () async {},
                  onItemSelected: (Song item) {},
                  inputDecoration: InputDecoration(
                    hintText: 'Search here',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      //height: 0.5,
                      color: COLOR_PRIMARY,
                    ),
                    filled: true,
                    fillColor: COLOR_SECONDARY,
                  ),
                ),
              ),
            ),
            
          ],
        ),
      )
    );
  }

  
}

class SongItem extends StatelessWidget {
  final Song song;

  const SongItem({
    Key? key,
    required this.song,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 110,
        width: 380,
        decoration: BoxDecoration(
          color: COLOR_SECONDARY,
          borderRadius: BorderRadius.circular(10),
        ),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(song.songName,
              style: const TextStyle(
              color: COLOR_PRIMARY,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              ),
            ),
            // Icon(
            //   Icons.music_note,
            //   color: COLOR_TERTIARY,
            // ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Song Name: ${song.songName}',
                  style: const TextStyle(
                    color: COLOR_PRIMARY,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Artist: ${song.artist}',
                  style: const TextStyle(
                    color: COLOR_PRIMARY,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EmptyView extends StatelessWidget {
  const EmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.error,
          color: Colors.red,
        ),
        Text('No song is found with this name',
          style: TextStyle(color: COLOR_SECONDARY)
        ),
      ],
    );
  }
}

class Song {
  String songName;
  String artist;

  Song({
    required this.songName,
    required this.artist,
  });
}