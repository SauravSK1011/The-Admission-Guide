// import 'dart:ffi';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:the_admission_guide/colors.dart';

import 'Pages/collagelist_page.dart';

var cities = ["Mumbai", "Pune", "Nagpur", "Nashik"];
var imgs = [
  "https://static.thenounproject.com/png/101020-200.png",
  "https://static.thenounproject.com/png/101020-200.png",
  "https://image.shutterstock.com/image-vector/nagpur-city-deekshabhoomi-icon-illustration-260nw-2186878091.jpg",
  "https://image.shutterstock.com/image-vector/lord-shiva-trimbakeshwar-jyotirlinga-temple-260nw-2136808177.jpg"
];
var courses = ["B.E/B.Tech", "MBBS", "Law", "B.Pharma"];
var courses_imgs = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFkjDWnI8zyQXAdNv6MQoWrLbv3NqGs5l0RfKOxdo&s",
  "https://media.istockphoto.com/vectors/caduceus-health-symbol-asclepiuss-wand-icon-black-color-illustration-vector-id1004243378?k=20&m=1004243378&s=612x612&w=0&h=-ZFduV1rapR7Rx7ltYPXyw3XV8dMqh1_cK0h_AEFDJY=",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9Mx-VGjVbyyZfPdD-KcBeRomZLS4FtGLlwJNnzIk&s",
  "https://media.istockphoto.com/vectors/pharmacy-snake-symbol-simple-flat-illustration-isolated-on-white-vector-id1215977803?k=20&m=1215977803&s=612x612&w=0&h=DCYbIy8JVqXSb39X_YeV_oGLxwHClz7Zi-o5ygQIX1I="
];
var courses_link = [];

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    double screenH = MediaQuery.of(context).size.height;
    double screenW = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: Container(
          width: screenW * 0.6,
          child: Drawer(
              backgroundColor: main_color, child: drawer(screenH, screenW))),
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Icon(Icons.menu),
            color: text_color_violet,
          );
        }),
        backgroundColor: main_color,
        elevation: 15,
        shadowColor: Colors.black,
        title: Center(
            child: Text(
          "The Admission Guide",
          style: TextStyle(fontWeight: FontWeight.bold, color: text_color_violet),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            part1(screenH, screenW),
            part2(screenH, screenW),
            SizedBox(
              height: 25,
            ),
            news(screenH, screenW),
          ],
        ),
      ),
    );
  }
}

class part1 extends StatelessWidget {
  final double screenH;
  final double screenw;

  part1(this.screenH, this.screenw);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset(
            "assets/homepage.jpg",
            //   color: Color.fromRGBO(0, 0, 0, 0.5),
            // colorBlendMode: BlendMode.modulate,

            width: screenw,
          ),
        ),
        // ClipRRect(
        //   borderRadius: BorderRadius.circular(25),
        //   child: Image.asset(colorBlendMode: BlendMode.modulate,
        //     "assets/black.png",width: screenw,
        //   ),
        // ),
        Padding(
          padding: EdgeInsets.only(left: 15, top: 70, right: 20),
          child: Column(
            children: [
              Text(
                "Get Perfect Collage",
                style: TextStyle(
                    color: main_color,
                    fontSize: 50,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 15,
              ),
              searchbox(),
            ],
          ),
        ),
      ]),
    );
  }
}

class searchbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.05,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Icon(Icons.search_rounded),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Search the collage",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: text_color_violet),
              ),
            ),
          ],
        ),
        color: main_color,
        height: 40,
      ),
    );
  }
}

class part2 extends StatelessWidget {
  final double screenH;
  final double screenw;

  part2(this.screenH, this.screenw);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 15),
          child: Text(
            "Search Collages by City",
            style: TextStyle(
                color: text_color_violet, fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int i = 0; i < cities.length; i++)
                mycard(i, imgs, cities, context)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 15),
          child: Text(
            "Search Collages by Course",
            style: TextStyle(
                color: text_color_violet, fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int i = 0; i < cities.length; i++)
                mycard(i, courses_imgs, courses, context)
            ],
          ),
        ),
      ],
    );
  }
}

Widget mycard(i, icon, name, context) {
  return InkWell(
    onTap: (() => Navigator.push(context, MaterialPageRoute(builder: (context) => Collagelist_Page(),))),
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Image.network(
                    icon[i],
                    height: 90,
                  ),
                  Text(
                    name[i],
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            )),
      ),
    ),
  );
}

Widget news(screenH, screenW) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "NEWS",
        style: TextStyle(
            color: text_color_violet, fontSize: 20, fontWeight: FontWeight.w400),
      ),
      newscard(screenH, screenW),
      newscard(screenH, screenW),
      newscard(screenH, screenW),
      newscard(screenH, screenW),
      newscard(screenH, screenW),
    ],
  );
}

Widget newscard(screenH, screenW) {
  return Card(
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 10),
          child: Image.network(
            "https://www.ndtv.com/education/cache-static/media/presets/625X400/article_images/2022/10/31/MHT-CET-CAP-Round-2-Allotment-Results-2022-Featured-Image.webp",
            width: 80,
            height: 150,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: screenW - 130,
                child: Text(
                  "MHT CET CAP Round 2 Allotment Result 2022 Out",
                  style: TextStyle(
                      color: text_color_violet,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                width: screenW - 130,
                child: Text(
                  "The Maharashtra State Common Entrance Test (CET) has declared the MHT CET CAP round 2 provisional allotment result today, October 31. Candidates registered for Maharashtra CET round 2 .............",
                  style: TextStyle(
                      color: text_color_violet,
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget drawer(screenH, screenW) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: userdask(),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Chose Categories",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: drawer_text_color,
              fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        for (int i = 0; i < cities.length; i++)
          cat(i, courses, screenW, screenH)
      ],
    ),
  );
}

Widget userdask() {
  return Row(
    children: [
      SizedBox(
        width: 20,
      ),
      ClipRRect(
        child: Image.network(
          "https://cdn-icons-png.flaticon.com/512/3003/3003035.png",
          height: 100,
        ),
      ),
      SizedBox(
        width: 20,
      ),
      Text(
        "Name",
        style: TextStyle(
            fontWeight: FontWeight.bold, color: text_color_violet, fontSize: 20),
      ),
    ],
  );
}

Widget cat(i, courses, screenW, screenH) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: screenW * 0.7,
          height: 35,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              courses[i],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: drawer_text_color,
                  fontSize: 15),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}
