import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_music/utils/app_colors.dart';

class Folder extends StatefulWidget {
  const Folder({super.key});

  @override
  State<Folder> createState() => _FolderState();
}

class _FolderState extends State<Folder> {

  List RecentalyPlayed = [
    {"name": "moods", "numberofplalist": 11},
    {"name": "blends", "numberofplalist": 8},
    {"name": "favs", "numberofplalist": 14},
    {"name": "random", "numberofplalist": 10},
    {"name": "alltime", "numberofplalist": 9},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.5],
                          colors: [Color(0xffA6F3FF), AppColors.tertiaryColor]),
                    shape: BoxShape.circle
                  ),
                  child: Icon(
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
            padding: EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 0.5],
                            colors: [Color(0xffA6F3FF), AppColors.tertiaryColor]),
                        shape: BoxShape.circle
                    ),
                    child: Icon(Icons.favorite, color: AppColors.secondaryColor)),
                Text("Add New Playlist",
                    style: GoogleFonts.varelaRound(
                        color: AppColors.fourthColor,
                        fontSize: 15,
                    ))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: RecentalyPlayed.length,
                itemBuilder: (BuildContext context, int index){
                    return Row(
                      children: [
                        Icon(Icons.file_copy, color: Colors.white38,),

                      ],
                    );
            }),
          )
        ],
      ),
    );
  }
}
