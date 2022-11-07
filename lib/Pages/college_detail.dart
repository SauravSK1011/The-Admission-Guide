import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:the_admission_guide/Firebase/firebase.dart';
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
  void initState() {
//  college23=
//  Firebase.getdata2();
//  print(college23);

// getlistofcol();
    super.initState();
  }
// Future<void> getlistofcol()async {

// await FirebaseFirestore.instance
//         .collection("Colleges")
//         .get()
//         .then((snapshort) => snapshort.docs.forEach((element) {
//               // print(element.);
//               listofcollage.add(CollegeModel(
//                 CUTOFF: element["CUTOFF"],
//                 Established: "",
//                 // element["Established"].toString(),
//                 Name: element["Name"],
//                 Location: element["Location"],
//                 INSTITUTE_FEE: element["INSTITUTE FEE"],
//                 PLACEMENTS: element["PLACEMENTS"],
//                 RANKING: element["RANKING"],
//                 HOSTEL_FEE: element["HOSTEL FEE"],
//                 Institute_Type: element["Institute Type"],
//               ));
//             }))
//         .catchError((err) => print(err));
//         print(listofcollage[0].CUTOFF);
// }
  @override
  Widget build(BuildContext context) {
    // print(widget.collage.PLACEMENTS["AVERAGE PACKAGE"]);
    Map placement = widget.collage.PLACEMENTS;
        var a=placement.keys.elementAt(0);
        print(a);

    // placement.forEach(
    //   (key, value) => print(key.toString() + "     " + value.toString()),
    // );

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
                      // child: Column(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     overviewwidget(context, "AVERAGE PACKAGE",
                      //         widget.collage["PLACEMENTS"]["AVERAGE PACKAGE"]),
                      //     const Divider(thickness: 1),
                      //     overviewwidget(context, "HIGH PACKAGE",
                      //         widget.collage["PLACEMENTS"]["HIGH PACKAGE"]),
                      //   ],
                      // ),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: placement.length,
                          itemBuilder: ((context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                overviewwidget(context, widget.collage.PLACEMENTS.keys.elementAt(index),
                                    widget.collage.PLACEMENTS.values.elementAt(index)),
                                const Divider(thickness: 1),
                              ],
                            );
                          })),

                      // child: widget.collage.PLACEMENTS.forEach((key, value) {
                      //   Column(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       overviewwidget(context, "AVERAGE PACKAGE",
                      //           widget.collage.PLACEMENTS[index]),
                      //       const Divider(thickness: 1),
                      //     ],
                      //   );
                      // }),
                    ),
                  ],
                ),
                // ExpansionTile(
                //   title: Text(
                //     "INSTITUTE FEE",
                //     style: TextStyle(
                //         fontSize: 30,
                //         fontWeight: FontWeight.bold,
                //         color: text_color_violet),
                //   ),
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.all(18.0),
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           overviewwidget(
                //               context,
                //               "Caution Money (One Time, Refundable)",
                //               widget.collage["INSTITUTE FEE"]
                //                   ["Caution Money (One Time, Refundable)	"]),
                //           const Divider(thickness: 1),
                //           overviewwidget(
                //               context,
                //               "Development Fees (per Year)",
                //               widget.collage["INSTITUTE FEE"]
                //                   ["Development Fees (per Year)	"]),
                //           const Divider(thickness: 1),
                //           overviewwidget(
                //               context,
                //               "Student Insurance (per Year)",
                //               widget.collage["INSTITUTE FEE"]
                //                   ["Student Insurance (per Year)	"]),
                //           const Divider(thickness: 1),
                //           overviewwidget(
                //               context,
                //               "Exam Fees (per Year)",
                //               widget.collage["INSTITUTE FEE"]
                //                   ["Exam Fees (per Year)	"]),
                //           const Divider(thickness: 1),
                //           overviewwidget(
                //               context,
                //               "Tuition Fee (per Year)",
                //               widget.collage["INSTITUTE FEE"]
                //                   ["Tuition Fee (per Year)"]),
                //           const Divider(thickness: 1),
                //           overviewwidget(
                //               context,
                //               "Other Fees (per Year)",
                //               widget.collage["INSTITUTE FEE"]
                //                   ["Other Fees (per Year)	"]),
                //           const Divider(thickness: 1),
                //           overviewwidget(context, "Total",
                //               widget.collage["INSTITUTE FEE"]["Total"]),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                // ExpansionTile(
                //   title: Text(
                //     "HOSTEL FEE",
                //     style: TextStyle(
                //         fontSize: 30,
                //         fontWeight: FontWeight.bold,
                //         color: text_color_violet),
                //   ),
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.all(18.0),
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           ExpansionTile(
                //             title: Text(
                //               "Hostel Rent",
                //               style: TextStyle(
                //                   fontSize: 30,
                //                   fontWeight: FontWeight.bold,
                //                   color: text_color_violet),
                //             ),
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.all(18.0),
                //                 child: Column(
                //                   mainAxisAlignment:
                //                       MainAxisAlignment.spaceBetween,
                //                   children: [
                //                     overviewwidget(
                //                         context,
                //                         "Boys Hostel",
                //                         widget.collage["HOSTEL FEE"]
                //                             ["Hostel Rent"]["Boys Hostel"]),
                //                     const Divider(thickness: 1),
                //                     overviewwidget(
                //                         context,
                //                         "Girls Hostel",
                //                         widget.collage["HOSTEL FEE"]
                //                             ["Hostel Rent"]["Girls Hostel"]),
                //                   ],
                //                 ),
                //               ),
                //             ],
                //           ),
                //           const Divider(thickness: 1),
                //           overviewwidget(context, "Other Charges",
                //               widget.collage["HOSTEL FEE"]["Other Charges	"]),
                //           cutoff(widget.collage)
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
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

// Widget detailwidget(){
//   return
// }

Widget cutoff(DocumentSnapshot collage) {
//  List<CollegeModel> college23= Firebase.getdata2();
// Map collegecutoff=collage["CUTOFF"];
// collegecutoff.forEach((ele)=>{
//   print(ele.toString())
// });
  // while(collage["CUTOFF"]){
  //   print(collage["CUTOFF"]);
  // }
  return Container();
  // return ExpansionTile(
  //                 title: Text(
  //                   "CUTOFF",
  //                   style: TextStyle(
  //                       fontSize: 30,
  //                       fontWeight: FontWeight.bold,
  //                       color: text_color_violet),
  //                 ),
  //                 children: [
  //                   Padding(
  //                     padding: const EdgeInsets.all(18.0),
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         ExpansionTile(
  //                           title: Text(
  //                             "General",
  //                             style: TextStyle(
  //                                 fontSize: 30,
  //                                 fontWeight: FontWeight.bold,
  //                                 color: text_color_violet),
  //                           ),
  //                           children: [
  //                             Padding(
  //                               padding: const EdgeInsets.all(18.0),
  //                               child: Column(
  //                                 mainAxisAlignment:
  //                                     MainAxisAlignment.spaceBetween,
  //                                 children: [
  //                                   overviewwidget(
  //                                       context,
  //                                       "Boys Hostel",
  //                                       collage["HOSTEL FEE"]["Hostel Rent"]
  //                                           ["Boys Hostel"]),
  //                                   const Divider(thickness: 1),
  //                                   overviewwidget(
  //                                       context,
  //                                       "Girls Hostel",
  //                                       collage["HOSTEL FEE"]["Hostel Rent"]
  //                                           ["Girls Hostel"]),
  //                                 ],
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                         const Divider(thickness: 1),
  //                         overviewwidget(context, "Other Charges",
  //                             collage["HOSTEL FEE"]["Other Charges	"]),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               );
}
