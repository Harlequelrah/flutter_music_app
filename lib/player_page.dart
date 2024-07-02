import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPlayerPage extends StatelessWidget {
  const MyPlayerPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const MyAppBar(),
      body: Container(
          color: Colors.white,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ImageAuthor(),
              PlayerControl(),
            ],
          )),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.chevron_left, color: Colors.white, size: 30),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: const [
        IconButton(
          icon: Icon(Icons.more_vert, color: Colors.white, size: 23),
          onPressed: null,
        ),
      ],
      backgroundColor: Colors.white.withOpacity(0),
    );
  }
}

class ImageAuthor extends StatelessWidget {
  const ImageAuthor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 550,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/ariana3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Stack(
          children: [
            TitleSection(),
            ArtistPictureSection(),
          ],
        ));
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 220,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Artist',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w300,
                  fontSize: 14.0,
                  color: Colors.white,
                )),
            Text('Ariana Grande',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w800,
                  fontSize: 17.0,
                  color: Colors.white,
                ))
          ],
        ));
  }
}

class ArtistPictureSection extends StatelessWidget {
  const ArtistPictureSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 200),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(50))),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 65.0,
                child: Container(
                  height: 250,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(50),
                      )),
                )),
            Positioned(
              top: 50.0,
              child: Container(
                  height: 275,
                  width: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('images/ariana3.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.blue.withOpacity(1), BlendMode.darken),
                    ),
                  )),
            )
          ],
        ));
  }
}

class PlayerControl extends StatelessWidget {
  const PlayerControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 30),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PlayingMusicTitle(),
            MusicSliderSection(),
            DurationSection(),
            MusicControlButtonSection(),
          ],
        ));
  }
}

class PlayingMusicTitle extends StatelessWidget {
  const PlayingMusicTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Text('Imagine',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w700,
                  fontSize: 25.0,
                  color: Colors.black,
                )),
            const SizedBox(width: 3),
            Text('Ariana Grande',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.0,
                  color: Colors.blue,
                )),
          ],
        ));
  }
}

class MusicSliderSection extends StatelessWidget {
  const MusicSliderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5),
        child: Slider(
            value: 19,
            min: 1.0,
            max: 100,
            divisions: 10,
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
            onChanged: (double newValue) {}));
  }
}

class DurationSection extends StatelessWidget {
  const DurationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 27, right: 25, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('1.08',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                  color: Colors.grey,
                )),
            Text('3.14',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                  color: Colors.grey,
                )),
          ],
        ));
  }
}

class MusicControlButtonSection extends StatelessWidget {
  const MusicControlButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const IconButton(
              icon: Icon(Icons.shuffle, color: Colors.grey, size: 35),
              onPressed: null,
            ),
            const IconButton(
              icon: Icon(Icons.skip_previous, color: Colors.black, size: 40),
              onPressed: null,
            ),
            ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: const CircleBorder(),
                  side: const BorderSide(width: 1.0, color: Colors.grey),
                ),
                child: Container(
                    padding: const EdgeInsets.all(10),
                    child: const Icon(Icons.pause,
                        color: Colors.black, size: 40.0))),
            const IconButton(
              icon: Icon(Icons.skip_next, color: Colors.black, size: 40),
              onPressed: null,
            ),
            const IconButton(
              icon: Icon(Icons.repeat, color: Colors.grey, size: 35),
              onPressed: null,
            ),
          ],
        ));
  }
}
