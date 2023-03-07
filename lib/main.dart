import 'package:flutter/material.dart';
import 'package:music_application/Components/custom_list_tile.dart';
import 'package:music_application/Screens/discovery_page.dart';
import 'package:music_application/Screens/discovery_page_test.dart';
import 'package:music_application/Screens/register_page.dart';
import 'package:music_application/theme/theme_constants.dart';

import 'Screens/unlock_account.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: RegisterPage(),
      home: const Scaffold(
        body: SafeArea(
          child: ExampleApp(),
        ),
      ),
      theme: themeData,
      debugShowCheckedModeBanner: false,
    );
  }
}

class MusicApp extends StatefulWidget {
  const MusicApp({super.key});

  @override
  State<MusicApp> createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('My Playlist', style: TextStyle(color: Colors.black)),
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: musicList.length,
                  itemBuilder: (context, index) => customListTile(
                        onTap: () {},
                        title: musicList[index]['title'],
                        singer: musicList[index]['singer'],
                        cover: musicList[index]['coverUrl'],
                      )),
            ),
            Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Color(0x55212121),
                    blurRadius: 8.0,
                  ),
                ]),
                child: Column(
                  children: [
                    Slider.adaptive(value: 0.0, onChanged: (value) {})
                  ],
                )),
          ],
        ));
  }
}
