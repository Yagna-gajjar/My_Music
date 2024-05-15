import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_sticky_widgets/flutter_sticky_widgets.dart';
import 'package:my_music/screens/SecondSearchPage.dart';
import 'package:my_music/utils/app_colors.dart';

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
  TextEditingController _searchController = TextEditingController();
  List searchListBrowseAll = [];
  List searchListYourTopGenres = [];

  void filtter(String value) {
    if(value.isEmpty){
      setState(() {
        searchListBrowseAll = Browse_All;
        searchListYourTopGenres = Your_Top_Genres;
      });
    }
    else {
      setState(() {
        searchListBrowseAll = Browse_All.where((e) => e["name"].trim().toLowerCase().contains(value.toLowerCase())).toList();
        searchListYourTopGenres = Your_Top_Genres.where((e) => e["name"].trim().toLowerCase().contains(value.toLowerCase())).toList();
      });
    }
  }

  @override
  void initState() {
    searchListBrowseAll = Browse_All;
    searchListYourTopGenres = Your_Top_Genres;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.cover,
                    )),
                Text(
                  "Search",
                  style: GoogleFonts.varelaRound(
                      color: const Color(0xff0CC0DF),
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextFormField(
                onChanged: (value) => filtter(value),
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'What do you want to listen to?',
                  hintStyle: GoogleFonts.varelaRound(color: AppColors.primaryColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none
                  ),
                  fillColor: Colors.white70,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.primaryColor
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear,
                        color: AppColors.primaryColor),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        searchListBrowseAll = Browse_All;
                        searchListYourTopGenres = Your_Top_Genres;
                      });
                    },
                  ),
                ),
                style: const TextStyle(
                  color: AppColors.secondaryColor, // Change text color here
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10, top: 30),
                  child: Text(
                    "Your Top Genres",
                    style: GoogleFonts.varelaRound(
                        color: Colors.white, fontSize: 20),
                  ),
                ),
                GridView(
                  physics: const NeverScrollableScrollPhysics(), // Disables scrolling.
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    childAspectRatio: (1 / .6), // Aspect ratio of each grid item
                  ),
                  shrinkWrap: true,
                  children: List.generate(searchListYourTopGenres.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      child: Container(
                        margin: const EdgeInsets.only(right: 5, bottom: 1),
                        decoration: BoxDecoration(
                            color: searchListYourTopGenres[index]["color"],
                            borderRadius: BorderRadius.circular(5)),
                        child: Stack(
                          children: [
                            Positioned(
                                left: 10,
                                top: 10,
                                child: Text(
                                  searchListYourTopGenres[index]["name"],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  style: const TextStyle(color: Colors.white),
                                )),
                            Positioned(
                                right: -10,
                                bottom: -10,
                                child: SizedBox(
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
                  margin: const EdgeInsets.only(bottom: 10, top: 50),
                  child: Text(
                    "Browse All",
                    style: GoogleFonts.varelaRound(
                        color: Colors.white, fontSize: 20),
                  ),
                ),
                GridView(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(), // Disables scrolling.
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    childAspectRatio: (1 / .6), // Aspect ratio of each grid item
                  ),
                  shrinkWrap: true,
                  children: List.generate(searchListBrowseAll.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      child: Container(
                        margin: const EdgeInsets.only(right: 5, bottom: 1),
                        decoration: BoxDecoration(
                            color: searchListBrowseAll[index]["color"],
                            borderRadius: BorderRadius.circular(5)),
                        child: Stack(
                          children: [
                            Positioned(
                                left: 10,
                                top: 10,
                                child: Text(
                                  searchListBrowseAll[index]["name"],
                                  style: const TextStyle(color: Colors.white),
                                )),
                            Positioned(
                                right: -10,
                                bottom: -10,
                                child: SizedBox(
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
    );
  }
}

