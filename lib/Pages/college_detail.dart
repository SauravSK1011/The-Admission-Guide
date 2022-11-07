
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:the_admission_guide/Model/college.dart';
import 'package:the_admission_guide/colors.dart';

class CollageDetail extends StatefulWidget {
  CollageDetail({super.key, required this.collage});
  CollegeModel collage;

  @override
  State<CollageDetail> createState() => _CollageDetailState();
}

class _CollageDetailState extends State<CollageDetail> {
  List<CollegeModel> listofcollage = [];


  @override
  Widget build(BuildContext context) {
    Map<String, Map<String, String>> cutoffofcollege = {};
    Map<String, String> temp1 = {};

    // print(widget.collage.PLACEMENTS["AVERAGE PACKAGE"]);
    Map placement = widget.collage.CUTOFF;
    Map a = placement.values.elementAt(0);

    Map<String, Map> cutoffs;

    a.forEach((key, value) => {
          temp1 = {},
          value.forEach((key, value) => temp1[key] = value.toString()),
          cutoffofcollege[key] = temp1
        });
    print(cutoffofcollege.values.elementAt(1).length);



    return Scaffold(
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
          style:
              TextStyle(fontWeight: FontWeight.bold, color: text_color_violet),
        )),
      ),
      body: Container(
        color: mybackgroundColor,
        child: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            imgwidget(context, widget.collage.IMG, widget.collage.Name),
            Column(
              children: [
                Text(
                  "OVERVIEW",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: text_color_violet),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      overviewwidget(context, "Name", widget.collage.Name),
                      const Divider(thickness: 1),
                      overviewwidget(context, "Institute Type",
                          widget.collage.Institute_Type),
                      Divider(thickness: 1),
                      overviewwidget(
                          context, "Location", widget.collage.Location),
                      const Divider(thickness: 1),
                      overviewwidget(
                          context, "Established", widget.collage.Established),
                    ],
                  ),
                ),                const Divider(thickness: 2.5),

                ExpansionTile(
                  title: Text(
                    "RANKING",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: text_color_violet),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: widget.collage.RANKING.length,
                          itemBuilder: ((context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                overviewwidget(
                                    context,
                                    widget.collage.RANKING.keys
                                        .elementAt(index),
                                    widget.collage.RANKING.values
                                        .elementAt(index)),
                                const Divider(thickness: 1),
                              ],
                            );
                          })),
                    ),
                  ],
                ),
                const Divider(thickness: 2.5),
                ExpansionTile(
                  title: Text(
                    "PLACEMENTS",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: text_color_violet),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: widget.collage.PLACEMENTS.length,
                          itemBuilder: ((context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                overviewwidget(
                                    context,
                                    widget.collage.PLACEMENTS.keys
                                        .elementAt(index),
                                    widget.collage.PLACEMENTS.values
                                        .elementAt(index)),
                                const Divider(thickness: 1),
                              ],
                            );
                          })),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "INSTITUTE FEE",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: text_color_violet),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: widget.collage.INSTITUTE_FEE.length,
                          itemBuilder: ((context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                overviewwidget(
                                    context,
                                    widget.collage.INSTITUTE_FEE.keys
                                        .elementAt(index),
                                    widget.collage.INSTITUTE_FEE.values
                                        .elementAt(index)),
                                const Divider(thickness: 1),
                              ],
                            );
                          })),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "HOSTEL FEE",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: text_color_violet),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: widget.collage.HOSTEL_FEE.length,
                          itemBuilder: ((context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                overviewwidget(
                                    context,
                                    widget.collage.HOSTEL_FEE.keys
                                        .elementAt(index),
                                    widget.collage.HOSTEL_FEE.values
                                        .elementAt(index)),
                                const Divider(thickness: 1),
                              ],
                            );
                          })),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Cutoff",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: text_color_violet),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: cutoffofcollege.keys.length,
                          itemBuilder: ((context, index) {
                            return ExpansionTile(
                              title: Text(
                                cutoffofcollege.keys.elementAt(index).toString(),
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: text_color_violet),
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: ListView.builder( 
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: cutoffofcollege.values.elementAt(index).length,
                                      itemBuilder: ((context, index2) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            overviewwidget(
                                                context,
                                                cutoffofcollege.values.elementAt(index).keys.elementAt(index2),
                                                cutoffofcollege.values.elementAt(index).values.elementAt(index2)),
                                            const Divider(thickness: 1),
                                          ],
                                        );
                                      })),
                                ),
                              ],
                            );

                           
                          })),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget overviewwidget(context, key, value) {
  return Card(
    elevation: 10,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    color: Color.fromARGB(255, 122, 120, 120),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Text(
                key,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: text_color),
              ),
            ),
          ),
          Flexible(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Text(
                value.toString(),
                style: TextStyle(fontSize: 20, color: text_color),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget imgwidget(context, img, name) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.network(
            img,
            height: 200,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/A_black_image.jpg/1280px-A_black_image.jpg",
              height: 200,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                name,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: main_color),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
