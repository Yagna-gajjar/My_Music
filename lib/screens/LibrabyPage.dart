import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  List Catagory = [
    {"name": "Folder", "color": Colors.white12},
    {"name": "Playlist","color": Colors.white12},
    {"name": "Artists","color": Colors.white12},
    {"name": "Albums","color": Colors.white12},
    {"name": "Podcast & Shows","color": Colors.white12},
  ];

  String _selected = "";

  int tappedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 30, right: 30),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.2],
                colors: [Color(0xff033f49), Colors.black])),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 60),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 60,
                              height: 60,
                              child: Image.asset(
                                'assets/logo.png',
                                fit: BoxFit.cover,
                              )),
                          Text(
                            "Your Library",
                            style: GoogleFonts.varelaRound(
                                color: const Color(0xff0CC0DF),
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                height: 33,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Catagory.length,
                    itemBuilder: (BuildContext context, int index) {
                    return Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          color: Catagory[index]["color"],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(Catagory[index]["name"], style: GoogleFonts.varelaRound(
                            color: Colors.white,
                        ),),
                      );
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

