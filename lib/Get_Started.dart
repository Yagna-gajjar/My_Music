import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Get_Started extends StatefulWidget {
  const Get_Started({super.key});

  @override
  State<Get_Started> createState() => _Get_StartedState();
}

class _Get_StartedState extends State<Get_Started> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List<Widget> list = [
    Text.rich(
        softWrap: true,
        textAlign: TextAlign.center,
        TextSpan(
            text: "From the ",
            style: TextStyle(fontSize: 28, color: Colors.white),
            children: <InlineSpan>[
              TextSpan(
                  text: 'latest ',
                  style: TextStyle(fontSize: 28, color: Color(0xff0CC0DF))),
              TextSpan(
                  text: 'to the ',
                  style: TextStyle(fontSize: 28, color: Colors.white)),
              TextSpan(
                  text: 'greatest ',
                  style: TextStyle(fontSize: 28, color: Color(0xff0CC0DF))),
              TextSpan(
                  text: 'hits, play your favorite tracks on ',
                  style: TextStyle(fontSize: 28, color: Colors.white)),
              TextSpan(
                  text: 'musium ',
                  style: TextStyle(fontSize: 28, color: Color(0xff0CC0DF))),
              TextSpan(
                  text: 'now!',
                  style: TextStyle(fontSize: 28, color: Colors.white)),
            ])),
    Text.rich(
        softWrap: true,
        textAlign: TextAlign.center,
        TextSpan(
            text: "From the ",
            style: TextStyle(fontSize: 28, color: Colors.white),
            children: <InlineSpan>[
              TextSpan(
                  text: 'latest ',
                  style: TextStyle(fontSize: 28, color: Color(0xff0CC0DF))),
              TextSpan(
                  text: 'to the ',
                  style: TextStyle(fontSize: 28, color: Colors.white)),
              TextSpan(
                  text: 'greatest ',
                  style: TextStyle(fontSize: 28, color: Color(0xff0CC0DF))),
              TextSpan(
                  text: 'hits, play your favorite tracks on ',
                  style: TextStyle(fontSize: 28, color: Colors.white)),
              TextSpan(
                  text: 'musium ',
                  style: TextStyle(fontSize: 28, color: Color(0xff0CC0DF))),
              TextSpan(
                  text: 'now!',
                  style: TextStyle(fontSize: 28, color: Colors.white)),
            ])),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0CC0DF),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Image.asset(
              '/img_girl.png',
              fit: BoxFit.cover,
            ),
          )),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        child: CarouselSlider(
                      options: CarouselOptions(
                          disableCenter: true,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                      items: list
                          .map((item) => Container(
                                margin: EdgeInsets.all(20),
                                child: item,
                              ))
                          .toList(),
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: list.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 50.0,
                            height: 4.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 1.0, horizontal: 1.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Color(0xff0CC0DF))
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                    Container(
                      width: 350,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff0CC0DF),
                            shadowColor: Color(0xff0CC0DF)
                          ),
                          
                          onPressed: () {
                            Navigator.pushNamed(context, '/HomePage');
                          },
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                            ),
                          )),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
//  musium now!
