import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_music/utils/app_colors.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  List Catagory = [
    {"name": "Folder"},
    {"name": "Playlist"},
    {"name": "Artists"},
    {"name": "Albums"},
    {"name": "Podcast & Shows"},
  ];

  int _tappedIndex = 0;

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
                      margin: const EdgeInsets.only(top: 60),
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
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _tappedIndex = index;
                        });
                      },
                      child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
                          decoration: BoxDecoration(
                            color: _tappedIndex == index ? AppColors.primaryColor : Colors.white12,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(Catagory[index]["name"], style: GoogleFonts.varelaRound(
                              color: Colors.white,
                          ),),
                        ),
                    );
                  }
                ),
              ),
              Container(
                child: Center(
                    child: Text(Catagory[_tappedIndex]["name"]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

