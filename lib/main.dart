import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        )));
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

void _playMusic() {
  // Add your code to handle the play music action here.
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
            const Positioned(
              right: 0,
              bottom: 20,
              child: MaterialButton(
                  onPressed: _playMusic,
                  color: Colors.blue,
                  shape: CircleBorder(),
                  child: Padding(
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
  const PlayListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 500,
    );
  }
}
