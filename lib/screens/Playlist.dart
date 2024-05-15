import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_music/utils/app_colors.dart';

class Playlist extends StatefulWidget {
  const Playlist({super.key});

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {

  List Playlists = [
    {"name": "morning vibes", "numberofsongs": 31},
    {"name": "Travaling", "numberofsongs": 20},
    {"name": "Navratri Non-Stop", "numberofsongs": 24},
    {"name": "24/7", "numberofsongs": 18},
    {"name": "All Time", "numberofsongs": 40},
    {"name": "Bollywood hits", "numberofsongs": 36},
    {"name": "Hollywood hits", "numberofsongs": 29},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.5],
                          colors: [Color(0xffA6F3FF), AppColors.tertiaryColor]),
                      shape: BoxShape.circle
                  ),
                  child: const Icon(
                    Icons.add, color: AppColors.secondaryColor,
                  ),
                ),
                Text("Add New Playlist",
                  style: GoogleFonts.varelaRound(
                    color: AppColors.fourthColor,
                    fontSize: 15,
                  ),)
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 20),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 0.5],
                            colors: [Color(0xffA6F3FF), AppColors.tertiaryColor]),
                        shape: BoxShape.circle
                    ),
                    child: const Icon(Icons.favorite_outline, color: AppColors.secondaryColor)),
                Text("Your Liked Songs",
                    style: GoogleFonts.varelaRound(
                      color: AppColors.fourthColor,
                      fontSize: 15,
                    ))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sort by", style: GoogleFonts.varelaRound(color: AppColors.fourthColor),),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text("Recently Played",
                        style: GoogleFonts.varelaRound(
                            color: AppColors.tertiaryColor
                        ),),
                    ),
                    const Icon(Icons.sort, color: Colors.white24,)
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView(
              physics: const NeverScrollableScrollPhysics(), // Disables scrolling.
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: (1 / .3),
              ),
              shrinkWrap: true,
              children: List.generate(Playlists.length, (index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.folder_copy,
                      size: 50,
                      color: AppColors.fourthColor,),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start ,
                          children: [
                            Text(Playlists[index]["name"],
                              style: GoogleFonts.varelaRound(
                                  fontSize: 20,
                                  color: AppColors.fourthColor
                              ),
                            ),
                            Text("${Playlists[index]["numberofplaylist"
                            ]} playlist",
                              style: GoogleFonts.varelaRound(
                                  fontSize: 15,
                                  color: Colors.white60
                              ),),
                          ],
                        ))
                  ],
                );
              }
              ),
            ),
          )
        ],
      ),
    );
  }
}
