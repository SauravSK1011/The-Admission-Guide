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

  @override
  void initState() {
    list = Firebase.getdata();
    // listofcollage = Firebase.getdata2();

    // print("list is");
    Firebase.getdata2();
    // print(list);
    getlistofcol();

    super.initState();
  }
Future<void> getlistofcol()async {

await FirebaseFirestore.instance
        .collection("Colleges")
        .get()
        .then((snapshort) => snapshort.docs.forEach((element) {
              // print(element.);
              listofcollage.add(CollegeModel(IMG: element["IMG"],
                CUTOFF: 
                element["CUTOFF"],
                Established: element["Established"].toString(),
                Name: element["Name"],
                Location: element["Location"],
                INSTITUTE_FEE: element["INSTITUTE FEE"],
                PLACEMENTS: element["PLACEMENTS"],
                RANKING: element["RANKING"],
                HOSTEL_FEE: element["HOSTEL FEE"],
                Institute_Type: element["Institute Type"],
              ));
            }))
        .catchError((err) => print(err));
        print(listofcollage[0].IMG);
}
  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.6;

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
          style: TextStyle(fontWeight: FontWeight.bold, color: text_color_violet),
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
                                      listofcollage[index].Name,
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
