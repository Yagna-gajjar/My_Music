import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_music/Bottom.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  List Your_Top_Genres = [
    {"name": "Pop", "color": Colors.pink},
    {"name": "Chill", "color": Colors.yellow},
    {"name": "kpop", "color": Colors.green},
    {"name": "indie", "color": Colors.brown}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(left: 30, right: 30, top: 15),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.2],
                  colors: [Color(0xff033f49), Colors.black])),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      width: 60,
                      height: 60,
                      child: Image.asset(
                        '/logo.png',
                        fit: BoxFit.cover,
                      )),
                  Text(
                    "Search",
                    style: GoogleFonts.varelaRound(
                        color: Color(0xff0CC0DF),
                        fontSize: 25,
                        fontWeight: FontWeight.w700
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Songs, Artists, Podcasts & More",
                    hintStyle: TextStyle(
                      color: Colors.black38
                    )
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10, top: 30),
                    child: Text(
                      "Your Top Genres",
                      style: GoogleFonts.varelaRound(
                          color: Colors.white, fontSize: 20),
                    ),
                  ),

                  GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: (1 / .6),
                    shrinkWrap: true,
                    children: List.generate(4, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10, top: 10),
                        child: Container(
                          margin: EdgeInsets.only(right: 5, bottom: 1),
                          decoration: BoxDecoration(
                            color: Your_Top_Genres[index]["color"],
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(Your_Top_Genres[index]["name"], style: TextStyle(color: Colors.white),)),
                              Expanded(
                                  child: Wrap(
                                    children: [Transform.rotate(
                                      angle: pi/6,
                                      child: Container(
                                        child: Image.asset(
                                          "/${Your_Top_Genres[index]["name"]}.png",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    ],
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
    );
  }
}
