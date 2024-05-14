import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_sticky_widgets/flutter_sticky_widgets.dart';
import 'package:my_music/screens/SecondSearchPage.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List Your_Top_Genres = [
    {"name": "Pop", "color": Colors.pink, "image": "Pop.png"},
    {"name": "Chill", "color": Colors.yellow, "image": "Chill.png"},
    {"name": "kpop", "color": Colors.green, "image": "kpop.png"},
    {"name": "indie", "color": Colors.brown, "image": "indie.png"}
  ];

  List Browse_All = [
    {"name": "coffee & jazz", "color": Colors.brown, "image": "image_0.png"},
    {"name": "lofi beats", "color": Colors.blue, "image": "image_1.png"},
    {"name": "Harry styles", "color": Colors.cyan, "image": "image_2.png"},
    {"name": "Anime OSTs", "color": Colors.amber, "image": "image_3.png"},
    {"name": "Anything goes", "color": Colors.greenAccent, "image": "image_4.png"},
    {"name": "Released", "color": Colors.red, "image": "image_5.png"},
    {"name": "Pop", "color": Colors.pink, "image": "Pop.png"},
    {"name": "Chill", "color": Colors.yellow, "image": "Chill.png"},
    {"name": "kpop", "color": Colors.green, "image": "kpop.png"},
    {"name": "indie", "color": Colors.brown, "image": "indie.png"},
    {"name": "coffee & jazz", "color": Colors.brown, "image": "image_0.png"},
    {"name": "lofi beats", "color": Colors.blue, "image": "image_1.png"},
    {"name": "Harry styles", "color": Colors.cyan, "image": "image_2.png"},
    {"name": "Anime OSTs", "color": Colors.amber, "image": "image_3.png"},
    {"name": "Anything goes", "color": Colors.greenAccent, "image": "image_4.png"}
  ];
  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: StickyContainer(
        displayOverFlowContent: true,
        stickyChildren: [
          StickyWidget(
            initialPosition: StickyPosition(top: 150, left: 30),
            finalPosition: StickyPosition(top: 20, left: 30),
            controller: _controller,
            child: InkWell(
              onTap: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SecondSearchPage()),
                );
              }),
              child: Container(
                padding: EdgeInsets.only(
                    top: 10, bottom: 10, right: 20, left: 20),
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 70,
                decoration: BoxDecoration(
                    color: Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(18)
                ),
                child: Row(
                  children: [
                    Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.search_rounded)),
                    Text("Songs, Artists, Padcasts & More",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: GoogleFonts.varelaRound(),)
                  ],
                ),
              ),
            ),
          ),
        ],
        child: Container(
          padding: EdgeInsets.only(left: 30, right: 30, top: 15),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.2],
                  colors: [Color(0xff033f49), Colors.black])),
          child: SingleChildScrollView(
            controller: _controller,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60),
                  child: Row(
                    children: [
                      Container(
                          width: 60,
                          height: 60,
                          child: Image.asset(
                            'assets/logo.png',
                            fit: BoxFit.cover,
                          )),
                      Text(
                        "Search",
                        style: GoogleFonts.varelaRound(
                            color: Color(0xff0CC0DF),
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10, top: 80),
                      child: Text(
                        "Your Top Genres",
                        style: GoogleFonts.varelaRound(
                            color: Colors.white, fontSize: 20),
                      ),
                    ),
                    GridView(
                      physics: NeverScrollableScrollPhysics(), // Disables scrolling.
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        childAspectRatio: (1 / .6), // Aspect ratio of each grid item
                      ),
                      shrinkWrap: true,
                      children: List.generate(Your_Top_Genres.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10, top: 10),
                          child: Container(
                            margin: EdgeInsets.only(right: 5, bottom: 1),
                            decoration: BoxDecoration(
                                color: Your_Top_Genres[index]["color"],
                                borderRadius: BorderRadius.circular(5)),
                            child: Stack(
                              children: [
                                Positioned(
                                    left: 10,
                                    top: 10,
                                    child: Text(
                                      Your_Top_Genres[index]["name"],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      style: TextStyle(color: Colors.white),
                                    )),
                                Positioned(
                                    right: -10,
                                    bottom: -10,
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      child: Transform.rotate(
                                        angle: pi / 6,
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(7),
                                          child: Image.asset(
                                            "assets/${Your_Top_Genres[index]["image"]}",
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10, top: 50),
                      child: Text(
                        "Browse All",
                        style: GoogleFonts.varelaRound(
                            color: Colors.white, fontSize: 20),
                      ),
                    ),
                    GridView(
                      physics: NeverScrollableScrollPhysics(), // Disables scrolling.
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        childAspectRatio: (1 / .6), // Aspect ratio of each grid item
                      ),
                      shrinkWrap: true,
                      children: List.generate(Browse_All.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10, top: 10),
                          child: Container(
                            margin: EdgeInsets.only(right: 5, bottom: 1),
                            decoration: BoxDecoration(
                                color: Browse_All[index]["color"],
                                borderRadius: BorderRadius.circular(5)),
                            child: Stack(
                              children: [
                                Positioned(
                                    left: 10,
                                    top: 10,
                                    child: Text(
                                      Browse_All[index]["name"],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                Positioned(
                                    right: -10,
                                    bottom: -10,
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      child: Transform.rotate(
                                        angle: pi / 6,
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(7),
                                          child: Image.asset(
                                            "assets/${Browse_All[index]["image"]}",
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

