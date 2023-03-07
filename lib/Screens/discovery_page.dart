// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:music_application/theme/theme_constants.dart';

class DiscoveryPage extends StatefulWidget {
   const DiscoveryPage({super.key});

  @override
  State<DiscoveryPage> createState() => _DiscoveryPage();
} 

class _DiscoveryPage extends State<DiscoveryPage>{

  List musicList = [
    {
      'title': "Tech House Vibes",
      'singer': "Alejandro Magana",
      'url':
          "https://assets.mixkit.co/music/preview/mixkit-tech-house-vibes-130.mp3",
      'coverUrl':
          'https://i0.wp.com/engineeringsamples.com/wp-content/uploads/2021/03/ESR_THVB_Cover-1.jpg?fit=600%2C600&ssl=1'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: Text(
            'Search for a song', 
            style: TextStyle(
            fontSize: 25,
            color: COLOR_SECONDARY,
            fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              //the search bar
              //Builder(builder: (BuildContext context) => searchBarSong(context)),
              
              // //the list items
              // ListView.builder(
              //     itemCount: musicList.length,
              //     itemBuilder: (context, index) => customListTile(
              //           onTap: () {},
              //           title: musicList[index]['title'],
              //           singer: musicList[index]['singer'],
              //           cover: musicList[index]['coverUrl'],
              //     )
              //   ),
            ],
          )
        )
      )
    );
  }
}
