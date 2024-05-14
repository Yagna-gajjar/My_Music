import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List continue_listning = [
    "coffee & jazz",
    "lofi beats",
    "Harry styles",
    "Anime OSTs",
    "Anything goes",
    "Released"
  ];
  List top_mixies = [
    {"name": "Pop", "color": Colors.pink},
    {"name": "Chill", "color": Colors.yellow},
    {"name": "kpop", "color": Colors.green}
  ];

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
                margin: const EdgeInsets.only(top:60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 15),
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                  image: const DecorationImage(
                                    image: AssetImage('assets/profile-picture.jpg'),
                                    fit: BoxFit.cover
                                  ),
                                  border: Border.all(
                                      color: const Color(0xff0CC0DF),
                                      width: 2,
                                      style: BorderStyle.solid
                                  )
                              ),
                            ),
                            Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Welcome Back!",
                                        style: GoogleFonts.varelaRound(
                                            color: Colors.white, fontSize: 17)),
                                    Text("Yagna Gajjar",
                                        style: GoogleFonts.varelaRound(
                                            color: Colors.white38,
                                            fontSize: 12)),
                                  ]),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.bar_chart,
                              color: Colors.white,
                              size: 25,
                            ),
                            Stack(
                              children: [
                                Icon(
                                  Icons.notifications_outlined,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                Positioned(
                                    top: 1.0,
                                    left: 2.5,
                                    child:  Stack(
                                      children: <Widget>[
                                        Icon(
                                          Icons.brightness_1,
                                          size: 10.0,
                                          color: Color(0xff0CC0DF),
                                        ),
                                      ],
                                    )
                                ),
                              ],
                            ),
                            Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    child: Text(
                      "Continue Listing",
                      style: GoogleFonts.varelaRound(
                          color: Colors.white, fontSize: 20),
                    ),
                  ),
                  GridView(
                    physics: NeverScrollableScrollPhysics(), // Disables scrolling.
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      childAspectRatio: (1 / .4), // Aspect ratio of each grid item
                    ),
                    shrinkWrap: true,
                    children: List.generate(continue_listning.length, (index) {
                      return Container(
                        padding: const EdgeInsets.only(right: 10, top: 8),
                        child: Container(
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/image_$index.png',
                                    fit: BoxFit.cover,
                                  )),
                              Expanded(
                                child: Text(continue_listning[index],
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.varelaRound(
                                        color: Colors.white, fontSize: 10)),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 40),
                    child: Text(
                      "Your Top Mixes",
                      style: GoogleFonts.varelaRound(
                          color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Container(
                    height: 140,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: top_mixies.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 10,
                                        color: top_mixies[index]["color"]))),
                            width: 130,
                            margin: const EdgeInsets.only(right: 20),
                            child: Stack(
                              children: [
                                Image.asset(
                                  'assets/${top_mixies[index]["name"]}.png',
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  left: -20,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: Colors.white54,
                                      shape: BoxShape.circle
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 5,
                                  left: 30,
                                  child: Text("${top_mixies[index]["name"]} Mix", style: GoogleFonts.varelaRound(
                                    color: Colors.white
                                  ),),
                                ),
                                Positioned(
                                  top: 40,
                                  right: -50,
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    decoration: const BoxDecoration(
                                        color: Colors.white54,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 40),
                    child: Text(
                      "Based on your recent istening",
                      style: GoogleFonts.varelaRound(
                          color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Container(
                    height: 180,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: continue_listning.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 180,
                            margin: const EdgeInsets.only(right: 30),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(
                                'assets/image_$index.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
