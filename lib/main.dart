import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'player_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: MyAppBar(),
        body: SingleChildScrollView(
            child: Column(
          children: [
            HeaderSection(),
            PlayListSection(),
          ],
        )),
        bottomNavigationBar: BottomSection());
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.blue,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.pause, color: Colors.white), label: ''),
          BottomNavigationBarItem(
              icon: Text("Imagine . Ariana Grande",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w400)),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_circle_up, color: Colors.white),
              label: ''),
        ]);
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white.withOpacity(0),
      elevation: 0,
      leading: const IconButton(
        icon: Icon(Icons.menu, color: Colors.white),
        onPressed: null,
      ),
      actions: const [
        IconButton(
          icon: Icon(Icons.more_vert, color: Colors.white),
          onPressed: null,
        ),
      ],
    );
  }
}

void playMusic(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const MyPlayerPage()));
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/ariana3.jpg'), fit: BoxFit.cover),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50))),
        child: Stack(
          children: [
            Positioned(
              left: 20,
              bottom: 30,
              child: Text('ARIANA   GRANDE',
                  style: GoogleFonts.arizonia(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w800)),
            ),
            Positioned(
              right: 0,
              bottom: 20,
              child: MaterialButton(
                  onPressed: () => playMusic(context),
                  color: Colors.blue,
                  shape: const CircleBorder(),
                  child: const Padding(
                    padding: EdgeInsets.all(14),
                    child: Icon(Icons.play_arrow_rounded,
                        color: Colors.white, size: 30),
                  )),
            )
          ],
        ));
  }
}

class PlayListSection extends StatelessWidget {
  final List playList = const [
    {'title': 'No tears left to cry', 'duration': '3.16', 'played': false},
    {'title': 'Imagine', 'duration': '3.14', 'played': true},
    {'title': 'Into you', 'duration': '3.13', 'played': false},
    {'title': '34 35', 'duration': '3.26', 'played': false},
    {'title': 'positions', 'duration': '2.58', 'played': false},
  ];
  const PlayListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(30, 40, 20, 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Popular',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    )),
                Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: const Text('Show All',
                        style: TextStyle(fontSize: 13, color: Colors.blue)))
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: playList.map((song) {
                return SizedBox(
                  height: 100,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(song['title'],
                            style: TextStyle(
                                color:
                                    song['played'] ? Colors.blue : Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                        Row(children: [
                          Text(song['duration'],
                              style: TextStyle(
                                  color: song['played']
                                      ? Colors.blue
                                      : Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          Icon(
                            Icons.more_vert,
                            color: song['played'] ? Colors.blue : Colors.grey,
                          )
                        ])
                      ]),
                );
              }).toList(),
            )
          ],
        ));
  }
}
