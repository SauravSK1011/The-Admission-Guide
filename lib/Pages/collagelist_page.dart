import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:the_admission_guide/Model/college.dart';
import 'package:the_admission_guide/Pages/college_detail.dart';
import 'package:the_admission_guide/colors.dart';

import '../Firebase/firebase.dart';

class Collagelist_Page extends StatefulWidget {
  const Collagelist_Page({super.key});

  @override
  State<Collagelist_Page> createState() => _Collagelist_PageState();
}

class _Collagelist_PageState extends State<Collagelist_Page> {
  late CollectionReference list;
  List<CollegeModel> listofcollage = [];
  bool loding = true;
  CollectionReference listcollages =
      FirebaseFirestore.instance.collection("Colleges");
  @override
  void initState() {
    list = Firebase.getdata();
    // listofcollage = Firebase.getdata2();

    // print("list is");
    // Firebase.getdata2();
    // print(list);
    getlistofcol();

    super.initState();
  }

  Future<void> getlistofcol() async {
    print("listcollages.limit is ");
    var abc = listcollages.get().then((value) => {
          value.docs.forEach((element) {
          var imh=element.data() as Map<String, dynamic>;
            print(imh["INSTITUTE FEE"]);
                        print("         ");

          })
        });
    // print(abc);
    await FirebaseFirestore.instance
        .collection("Colleges")
        .get()
        .then((snapshort) => snapshort.docs.forEach((college) {
                    var collegeinfo=college.data() as Map<String, dynamic>;
              print("collegeinfo is");

              print(collegeinfo);
              listofcollage.add(CollegeModel(
                IMG: collegeinfo["IMG"],
                CUTOFF: collegeinfo["CUTOFF"],
                Established: collegeinfo["Established"].toString(),
                Name: collegeinfo["Name"],
                Location: collegeinfo["Location"],
                INSTITUTE_FEE: collegeinfo["INSTITUTE_FEE"],
                PLACEMENTS: collegeinfo["PLACEMENTS"],
                RANKING: collegeinfo["RANKING"],
                HOSTEL_FEE: collegeinfo["HOSTEL_FEE"],
                Institute_Type: collegeinfo["Institute_Type"],
                
              ));
            }))
        .catchError((err) => print(err));
    // listofcollage.forEach((element) {
    //   print(element);
    //   print(
    //       "                                                                          ");
    // });
    // adddata();
    setState(() {
                    print("Length is "+listofcollage.length.toString());

      loding = false;
    });
  }

  Future<void> adddata() async {
    return listcollages.doc("PICT")
        .set(listofcollage[0].toMap())
        .then((value) => print("done"))
        .catchError((e) {
      print("errer is $e");
    });
  }

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.6;

    return loding
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              leading: Builder(builder: (BuildContext context) {
                return IconButton(
                  onPressed: () => adddata(),
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
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: text_color_violet),
              )),
            ),
            body:
                // if (collagesnapshot.hasData) {
                ListView.builder(
              itemCount: listofcollage.length,
              itemBuilder: ((context, index) {
                // final DocumentSnapshot collagesnap =
                //     collagesnapshot.data!.docs[index];

                return ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CollageDetail(
                                    collage: listofcollage[index],
                                  )))),
                      child: Card(
                        elevation: 10,
                        color: Color.fromARGB(255, 173, 172, 172),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(
                                    listofcollage[index].IMG,
                                    // width: 100,
                                    // height: 100,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: c_width,
                                    child: Text(
                                      listofcollage[index].Name.toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: text_color_violet),
                                    ),
                                  )

                                  // Text("Institute Type: "+collagesnap["Institute Type"]),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            )
            // }
            // return Center(
            //   child: CircularProgressIndicator(),
            // );
            );
  }
}
